Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3F13BE447
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 10:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhGGIZk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 04:25:40 -0400
Received: from mo-csw-fb1514.securemx.jp ([210.130.202.170]:35850 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbhGGIZk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 04:25:40 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1514) id 1677wSU6011246; Wed, 7 Jul 2021 16:58:30 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 1677wE9R004110; Wed, 7 Jul 2021 16:58:14 +0900
X-Iguazu-Qid: 34tMccFKQO16ppVsku
X-Iguazu-QSIG: v=2; s=0; t=1625644693; q=34tMccFKQO16ppVsku; m=W3KAiAWwTY4IX/KNXH8f8VIz6VBEhT6n4h7cixhQRpg=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1510) id 1677wCVv006377
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 7 Jul 2021 16:58:13 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id D0FB41000B2;
        Wed,  7 Jul 2021 16:58:12 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 1677wCnS003634;
        Wed, 7 Jul 2021 16:58:12 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 00/10] Update  SPDX identifier
Date:   Wed,  7 Jul 2021 16:57:54 +0900
X-TSB-HOP: ON
Message-Id: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Some RTC drivers have not migrated to SPDX identifiers. This
modifies the SPDX identifier migration and formatting.

Best regards,
  Nobuhiro

Nobuhiro Iwamatsu (10):
  rtc: au1xxx: convert to SPDX identifier
  rtc: ds1374: convert to SPDX identifier
  rtc: max6900: convert to SPDX identifier
  rtc: palmas: convert to SPDX identifier
  rtc: sc27xx: Fix format of SPDX identifier
  rtc: rtd119x: Fix format of SPDX identifier
  rtc: tps80031: convert to SPDX identifier
  rtc: tps6586x: convert to SPDX identifier
  rtc: starfire: convert to SPDX identifier
  rtc: spear: convert to SPDX identifier

 drivers/rtc/rtc-au1xxx.c   |  5 +----
 drivers/rtc/rtc-ds1374.c   |  7 ++-----
 drivers/rtc/rtc-max6900.c  |  8 +++-----
 drivers/rtc/rtc-palmas.c   | 15 +--------------
 drivers/rtc/rtc-rtd119x.c  |  3 +--
 drivers/rtc/rtc-sc27xx.c   |  2 +-
 drivers/rtc/rtc-spear.c    |  5 +----
 drivers/rtc/rtc-starfire.c |  2 +-
 drivers/rtc/rtc-tps6586x.c | 15 +--------------
 drivers/rtc/rtc-tps80031.c | 15 +--------------
 10 files changed, 13 insertions(+), 64 deletions(-)

-- 
2.32.0

