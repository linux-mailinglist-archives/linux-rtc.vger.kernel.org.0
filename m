Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5908776E2AB
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Aug 2023 10:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbjHCIPi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Aug 2023 04:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbjHCIPG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Aug 2023 04:15:06 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBA6268D
        for <linux-rtc@vger.kernel.org>; Thu,  3 Aug 2023 01:07:52 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RGhFg5VhzzNm9C;
        Thu,  3 Aug 2023 16:04:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 16:07:49 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/2] rtc: Do not check for 0 return after calling platform_get_irq()
Date:   Thu, 3 Aug 2023 16:07:11 +0800
Message-ID: <20230803080713.4061782-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Since commit a85a6c86c25b ("driver core: platform: Clarify that
IRQ 0 is invalid"), there is no possible both for platform_get_irq()
to return 0.

And the return value of platform_get_irq() is more sensible
to show the error reason.

Since commit 2043727c2882 ("driver core: platform: Make use of
the helper function dev_err_probe()"), there is no need to call
the dev_warn() function directly to print a custom message when
handling an error from platform_get_irq() function as
it is going to display an appropriate error message
in case of a failure.

Ruan Jinjie (2):
  rtc: omap: Do not check for 0 return after calling platform_get_irq()
  rtc: tps65910: Remove redundant dev_warn() and do not check for 0
    return after calling platform_get_irq()

 drivers/rtc/rtc-omap.c     | 8 ++++----
 drivers/rtc/rtc-tps65910.c | 7 ++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.34.1

