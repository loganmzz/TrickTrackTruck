---
title: Specifications
---
**DISCLAIMER** This is toy-project document and it's not supposed to be representative of a real one. DON'T USE IT as an example.

**Version 1.0 : 2016-12-02**

### Introduction

This document aims to track both business and technical requirements which Trick Track Truck system must cover.

### Basics

Trick Track Truck system aims to offer management facilities for a delivery company.

Each **rotation** is compound of **deliveries**. A delivery represents a ride between two **delivery point**. Both **driver** and **vehicle** are supposed to be the same for the entire delivery. In exceptional conditions either the driver, or vehicle, or both can change between two steps of a single delivery.

A rotation is uniquely identified by an 10-length alphanumeric **identifier** and a **head date**. If a delivery spans over multiple day, the **head date** doesn't necessarly match **planned delivery date**.


### UC01 - Import planning data

An external system, `Mainframe planner`, delivers files of fixed-length line records. Each line is compound of 120 characters and represents a record.
Lines that doesn't match are invalid and must be ignored.

Each record represents a **rotation period**. Most rotations are periodics and repeats for a given **range date** following a weekday scheme.

 Here the description of main fields:

| Offset | Length | Key             | Description                                                                            |
|----------------------------------------------------------------------------------------------------------------------------|
|   0    | 10     | ROTATION-ID     | Rotation identifier                                                                    |
|  10    |  8     | ROTATION-START  | Rotation **period** start date in format "YYYYMMDD"                                    |
|  18    |  8     | ROTATION-END    | Rotation **period** end date                                                           |
|  26    |  7     | ROTATION-DAYS   | Flags ('Y' or 'N') from Monday to Sunday on which rotation is repeated in the interval |
|  33    | 10     | VEHICLE-ID      | Identifier of the vehicle which is supposed to do rotations                            |
|  43    | 27     | VEHICLE-TYPE    | Informations to describes kinds of vehicle (in case of replacement)                    |
|  70    | 10     | DRIVER-ID       | Identifier of the driver which is supposed to do rotations                             |
|  80    | 20     | DRIVER-NAME     | First characters of driver last name                                                   |
| 100    |  2     | PACKAGE-1-TYPE  | Code of first **package type**                                                         |
| 102    |  3     | PACKAGE-1-COUNT | Number of first package type                                                           |
| 105    |  2     | PACKAGE-2-TYPE  | Code of second package type                                                            |
| 107    |  3     | PACKAGE-2-COUNT | Number of second package type                                                          |
| 110    |  2     | PACKAGE-3-TYPE  | Code of third package type                                                             |
| 112    |  3     | PACKAGE-3-COUNT | Number of third package type                                                           |
| 115    |  3     | FILLER          | _unused_                                                                               |

Periods mustn't overlap, but in this case behaviour is currently undefined.
