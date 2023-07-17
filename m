Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048A57562EA
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jul 2023 14:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjGQMlS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 Jul 2023 08:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbjGQMlG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 Jul 2023 08:41:06 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F1CFE56;
        Mon, 17 Jul 2023 05:41:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="169500973"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jul 2023 21:41:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D8D544000C79;
        Mon, 17 Jul 2023 21:41:01 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] pcf85063 driver improvements
Date:   Mon, 17 Jul 2023 13:40:57 +0100
Message-Id: <20230717124059.196244-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This patch series is based on the code improvement work done for
rtc-isl1208 driver and is just compile tested.

v1->v2:
 * Added Rb tag from Geert for patch#1
 * Added patch#2 for dropping enum pcf85063_type and the array pcf85063_cfg[]
   as individual variables, and make lines shorter by referring to
   e.g. &pcf85063_cfg instead of &pcf85063_cfg[PCF85063].

Biju Das (2):
  rtc: pcf85063: Simplify probe()
  rtc: pcf85063: Drop enum pcf85063_type and split pcf85063_cfg[]

 drivers/rtc/rtc-pcf85063.c | 99 ++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 58 deletions(-)

-- 
2.25.1

