Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD2E440C30
	for <lists+linux-rtc@lfdr.de>; Sun, 31 Oct 2021 00:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhJ3Wxh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Oct 2021 18:53:37 -0400
Received: from smtp2.axis.com ([195.60.68.18]:25911 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230338AbhJ3Wxg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 30 Oct 2021 18:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635634266;
  x=1667170266;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=42j68thEGgiIFDyh9NmT0O7JIbX2KjBzsYow1sqNjm4=;
  b=kN4cPQPTHW3xSgOtO+Jktn8q2BHeOzZNgyDetI8trkxfft2NlLhht0Xt
   iS98yoC2qbz7huWOG47MfG2C+nMwBUqzoxuRGoYtp4MnRK28p28/MkUse
   ERgoh2oU74O1IiMdg44wZHOXKbf8zqTsuR62Ad2dVQssXnxexoAF1NYsS
   5xb1hcSGouZBPX65TpAuLS1axvf2CSM7J7bBZuz4WWt8PxJjd4M/bhPNw
   pDjobv+a+Ckw63yXBk+1W1armpxMyoGIxrtMIazd/rE4lkT9uAVqulacn
   RGdf6Y0rNwL9oKbVvI2XXYhaBzEH8OJozACs6Dd+rSIhm7ThhSbjVb8LY
   Q==;
From:   Pavel Modilaynen <pavel.modilaynen@axis.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lkml@axis.com>, <kernel@axis.com>,
        "Pavel Modilaynen" <pavelmn@axis.com>
Subject: [PATCH 0/2] *** Ricoh RS5C372: add support for Xtal trimming configuration ***
Date:   Sun, 31 Oct 2021 00:50:52 +0200
Message-ID: <20211030225054.32114-1-pavel.modilaynen@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Pavel Modilaynen <pavelmn@axis.com>

*** BLURB HERE ***

Add support for Xtal trimming configuration with new DT property: ricoh,trim.
This uint8 property is to contain raw value to setup Oscillation Adjustment
register (0x7) of Ricoh RS5C372 and similar RTC controllers.
This raw value has device model specific format and is used to adjust
(subtract or add) time counts per second (normally 32768) on regular
intervals (e.g. every 20th second).

Pavel Modilaynen (2):
  rtc: rs5c372: Add support for trim configuration
  dt-bindings: rtc: Add bindings for Ricoh rs5c372

 .../bindings/rtc/ricoh,rs5c372.yaml           | 58 +++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  | 12 ----
 drivers/rtc/rtc-rs5c372.c                     | 18 +++++-
 3 files changed, 75 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/ricoh,rs5c372.yaml

-- 
2.20.1

