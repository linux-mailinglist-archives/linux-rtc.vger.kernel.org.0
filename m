Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290F634BF54
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Mar 2021 23:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbhC1Va0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 28 Mar 2021 17:30:26 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:44346 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhC1V3f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 28 Mar 2021 17:29:35 -0400
Received: from [37.142.126.90] (port=46454 helo=zimbra01.compulab.co.il)
        by clab.compulab.co.il with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <kirill.kapranov@compulab.co.il>)
        id 1lQcYW-0033MI-Tp; Sun, 28 Mar 2021 17:02:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 75C37E81CB001;
        Mon, 29 Mar 2021 00:02:43 +0300 (IDT)
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id fw48-b84IdP6; Mon, 29 Mar 2021 00:02:43 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 036ACE81CB017;
        Mon, 29 Mar 2021 00:02:43 +0300 (IDT)
X-Virus-Scanned: amavisd-new at zimbra01.compulab.co.il
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id kg7GTpoUk2uL; Mon, 29 Mar 2021 00:02:42 +0300 (IDT)
Received: from kkk.compulab.local (lifshitz-linux.compulab.local [192.168.11.10])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id D137AE81CB001;
        Mon, 29 Mar 2021 00:02:42 +0300 (IDT)
From:   Kirill Kapranov <kirill.kapranov@compulab.co.il>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        phdm@macqel.be, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kirill Kapranov <kirill.kapranov@compulab.co.il>
Subject: [PATCH 0/4] rtc:abx80x: Enable distributed digital calibration
Date:   Mon, 29 Mar 2021 00:02:28 +0300
Message-Id: <20210328210232.10395-1-kirill.kapranov@compulab.co.il>
X-Mailer: git-send-email 2.11.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - clab.compulab.co.il
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Get-Message-Sender-Via: clab.compulab.co.il: mailgid no entry from get_recent_authed_mail_ips_entry
X-Authenticated-Sender: clab.compulab.co.il: 
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch series enables a Distributed Digital Calibration function for
the RTC of the family. This feature allows to improve the RTC accuracy by
means of compensation an XT oscillator drift. To learn more, see:
AB08XX Series Ultra Low Power RTC IC User's Guide
https://abracon.com/realtimeclock/AB08XX-Application-Manual.pdf

The patches 1 and 2 enable SQW output, that is necessary for subsequent
measurement and computation. However, this feature may be enabled and used
independently, as is.

The patches 3 and 4 enable the XT calibration feature per se. The SQW
output must be enabled for usage of this feature.

TIA!
Kirill

Kirill Kapranov (4):
  dt-bindings: rtc: abracon,abx80x: Add sqw property
  rtc:abx80x: Enable SQW output
  dt-bindings: rtc: abracon,abx80x: Add xt-frequency property
  rtc:abx80x: Enable xt digital calibration

 .../devicetree/bindings/rtc/abracon,abx80x.txt |  25 ++
 drivers/rtc/rtc-abx80x.c                       | 252 +++++++++++++++++++++
 2 files changed, 277 insertions(+)

-- 
2.11.0

