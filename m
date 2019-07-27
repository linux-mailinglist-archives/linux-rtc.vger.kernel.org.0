Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A44777CC
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jul 2019 11:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbfG0JAY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 27 Jul 2019 05:00:24 -0400
Received: from dd39320.kasserver.com ([85.13.155.146]:60436 "EHLO
        dd39320.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbfG0JAY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 27 Jul 2019 05:00:24 -0400
Received: from dd39320.kasserver.com (dd0802.kasserver.com [85.13.143.1])
        by dd39320.kasserver.com (Postfix) with ESMTPSA id ABF132CE0139
        for <linux-rtc@vger.kernel.org>; Sat, 27 Jul 2019 11:00:23 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-SenderIP: 77.75.145.69
User-Agent: ALL-INKL Webmail 2.11
Subject: RTC Epson Toyocom RX-8025T
From:   marcus.wolf@wolf-entwicklungen.de
To:     linux-rtc@vger.kernel.org
Message-Id: <20190727090023.ABF132CE0139@dd39320.kasserver.com>
Date:   Sat, 27 Jul 2019 11:00:23 +0200 (CEST)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alessandro, hello Alexandre,

in a product of a customer of mine, the RX-8025T real time clock from Epson Toyocom is used.

My customer would like me to integrate the driver for this clock to mainline of the kernel.

At the moment, we have a seperate implementation, basing on the implemenattion of the existing RX-8025 driver.

Although the rtc of my customer has almost the same "name" as the one, the current driver is available for (just last letter differs), it works quite different. So for example I compared the registerset of the two clocks.Only 5 of 16 registers are identical, 3 are very similar, but the other 8 are completely different. Also the functionality is quite different. Of course first of all, both are clocks, but all aditional features are not identical. The already supported SA type has two alarms - a day and a week alarm. The tyoe of my customer (t) just has one alarm, that can be switched to day and to week mode. In adition it has a timer and an 8bit RAM cell. In addition the protocol how to adress the registers on I2C is different....

Would you like me to propose you the support for the RX-8025T as a separate implementation - aka new driver?
On which base you'd like to see the patches? Head of mainline, last stable (5.2.2), or ....?

Thanks a lot,

Marcus Wolf

Wolf-Entwicklungen
Helene-Lange-Weg 23
80637 München

