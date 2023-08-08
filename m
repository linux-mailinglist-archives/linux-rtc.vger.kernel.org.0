Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 800C6774D33
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Aug 2023 23:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjHHVnB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Aug 2023 17:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjHHVnB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Aug 2023 17:43:01 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078043CD10
        for <linux-rtc@vger.kernel.org>; Tue,  8 Aug 2023 09:41:43 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RKs3P6QH6z1L8wW;
        Tue,  8 Aug 2023 19:51:29 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 19:52:39 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <nicolas.ferre@microchip.com>,
        <claudiu.beznea@tuxon.dev>, <avifishman70@gmail.com>,
        <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
        <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next 0/5] rtc: remove redundant of_match_ptr()
Date:   Tue, 8 Aug 2023 19:52:08 +0800
Message-ID: <20230808115213.154377-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr() here. We remove of_match_ptr().

Zhu Wang (5):
  rtc: aspeed: remove redundant of_match_ptr()
  rtc: at91sam9: remove redundant of_match_ptr()
  rtc: nct3018y: remove redundant of_match_ptr()
  rtc: armada38x: remove redundant of_match_ptr()
  rtc: at91rm9200: remove redundant of_match_ptr()

 drivers/rtc/rtc-armada38x.c  | 4 +---
 drivers/rtc/rtc-aspeed.c     | 2 +-
 drivers/rtc/rtc-at91rm9200.c | 2 +-
 drivers/rtc/rtc-at91sam9.c   | 2 +-
 drivers/rtc/rtc-nct3018y.c   | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

-- 
2.17.1

