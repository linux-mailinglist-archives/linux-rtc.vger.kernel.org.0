Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DCB4304BC
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Oct 2021 21:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbhJPTXv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 16 Oct 2021 15:23:51 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:44825 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbhJPTXv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 16 Oct 2021 15:23:51 -0400
IronPort-SDR: TcqhI8DNzJS8y/p59kUvTuEgY4AcjIwJuK2zccie2IOj6ow0ClLOqMcO1+e+9PKVVuaNgoOpjV
 GPjxtENqs6mVcZrV44rgryG4UT7K8NDdGtZ1cwHarPpnvfnaivAEuPRF0MrCISrlGQ945w5soq
 Rt8hlmmhvpKy9pJ8AyFD0d56FBF2krjNuV7VrIxvhD/bQ00ovNpxflCHsMC0B+pH2uugjMBP+H
 I2EIdPxkPJ5xCAnweuhOuMSXea4MtTCAb8oHywHiICRBAY1cL7durmyiWSXfCQee30vuHHRS3A
 996Alv8IJk0vrx0SLzpmoxB+
X-IronPort-AV: E=Sophos;i="5.85,378,1624348800"; 
   d="scan'208";a="69743824"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 16 Oct 2021 11:21:42 -0800
IronPort-SDR: aM7BHjH34cLbQdUnst9lFEehOi0L9zbQVYS+h+ayZgS6BXVKw1NiZggCIZdvqx4yAhDKhHjWDF
 gYVmUOndX/9OQauZtYxvGvH6SVX62DlFZgMtzoU7N2dHDSTUyC/oMkwUji6HfGNhpFWZvvu3h1
 bpVq7MtJqkfptNKzDHI+IIfO2yz4DT9r5ZAcrudVEVW8kYsn9xZclHFbJ/GUS2lckU1FC6FqjO
 0AibMPCOW98hKO0EPDx2NPA81En9f+TLaUwesrNAA8+Am37jNyIUZsYVnr3ugYBSbWKtBNn6IX
 wrM=
From:   Alexey Firago <alexey_firago@mentor.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH 0/2] rtc: Add driver for MAX31343
Date:   Sat, 16 Oct 2021 22:21:16 +0300
Message-ID: <20211016192118.255624-1-alexey_firago@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds support for the Maxim Integrated MAX31343 RTC.
Publicly available datasheet can be found at:
https://datasheets.maximintegrated.com/en/ds/MAX31343.pdf

Currently supported features are:
- Date/time
- SRAM
- Temperature sensor

Features to be implemented:
- Interrupts (my current platform doesn't have IRQ line connected)
- Alarms, countdown timer
- Clock output
- Trickle charger

Patches were verified on a custom NXP i.MX8MPlus based platform.

Alexey Firago (2):
  rtc: max31343: Add a driver for Maxim MAX31343
  dt-bindings: rtc: Add Maxim Integrated MAX31343

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-max31343.c                    | 494 ++++++++++++++++++
 4 files changed, 507 insertions(+)
 create mode 100644 drivers/rtc/rtc-max31343.c

-- 
2.25.1

