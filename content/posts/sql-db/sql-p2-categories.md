---
title: SQL - basic commands
date: 2020-02-04
draft: false
diagram: false
tags: [shell, bash]
slug: bash-p1-basics
toc: true
summary: basic bash commands
---

## SQL語法

- [SQL語法](#sql%e8%aa%9e%e6%b3%95)
- [資料定義語言 DDL](#%e8%b3%87%e6%96%99%e5%ae%9a%e7%be%a9%e8%aa%9e%e8%a8%80-ddl)
- [資料操控語言 DML](#%e8%b3%87%e6%96%99%e6%93%8d%e6%8e%a7%e8%aa%9e%e8%a8%80-dml)
- [資料操控語言](#%e8%b3%87%e6%96%99%e6%93%8d%e6%8e%a7%e8%aa%9e%e8%a8%80)
- [資料控制語言 DCL](#%e8%b3%87%e6%96%99%e6%8e%a7%e5%88%b6%e8%aa%9e%e8%a8%80-dcl)
- [References](#references)

## 資料定義語言 DDL

- Data Definition Language
- 屬於DBMS語言的一種，為SQL的子集
- 用於定義概念綱要(Conceptual Schemas)以及內部綱要(Internal Schemas)
- DBMS內建的DDL編譯器能夠處理DDL，識別綱要建構(Schema Contruct)的描述(Description)並加以存入DBMS目錄中的綱要描述(Schema Description)
- 包含
  - **CREATE**
  - **ALTER**
  - **DROP**

## 資料操控語言 DML

- Data Manipulation Lauguage
- 屬於DBMS語言的一種，為SQL的子集
- 包含
  - **INSERT**
  - **UPDATE**
  - **DELETE**
- 加上**SELECT**可合稱CRUD(增查改刪)

## 資料操控語言

- Data Query Lauguage
- 屬於DBMS語言的一種，為SQL的子集
- 包含
  - **SELECT**
  - **FROM**
  - **WHERE**
  - **GROUP BY**
  - **ORDER BY**

## 資料控制語言 DCL

- Data Control Lauguage
- 屬於DBMS語言的一種，為SQL的子集
- 對資料的存取權限進行控制的指令，可以控制特定使用者帳戶對資料表等資料庫物件的控制權
- 包含
  - **GRANT**
  - **REVOKE**
  - **DENY**

## References

- <https://zh.wikipedia.org/wiki/SQL>
