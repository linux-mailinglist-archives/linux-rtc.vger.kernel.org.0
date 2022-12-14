Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575B064D1F8
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Dec 2022 22:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiLNVv1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Dec 2022 16:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLNVv0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Dec 2022 16:51:26 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84912EF09
        for <linux-rtc@vger.kernel.org>; Wed, 14 Dec 2022 13:51:24 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id EAADE1C0004;
        Wed, 14 Dec 2022 21:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1671054683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/n8b4bG8PydiVRrDt7wGWv2XM7vmpfvtwz02qZxqPNI=;
        b=ZIDUT3PDkasRSGdX9OeHeYclaCUgy9J9Ms57rpTMf+VyP7gZcxS1mkNlPNU9a5sIfYnmc2
        B1h9Zx4TrChVyF771IebnyQan2yGHxqXpGfyqmBo4B6SHgxiCW5I/v9VR+xeFLFwWFrSRw
        4rJUxMrAdcQ9h0hGlHBXW5s0ZYRlJDTNLyGXUyVcLgQl89kmmCAgWJCGvKeUgK4+2mcXnB
        CycQn71gEsdHUFk7aRaaJkkhQuNvufyVLcLdFItHdRJ/2JONjm7JIBIfv/jNOM0rtNZuKB
        yekfRKyuq4b850B7H5prYUfevcjy3JMyglapYehr4W4rF3ipliqfSFEWsCJNjg==
Date:   Wed, 14 Dec 2022 22:51:22 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, GUO Zihua <guozihua@huawei.com>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: mxc_v2: Add missing clk_disable_unprepare()
Message-ID: <167105463768.30237.14563822244889625931.b4-ty@bootlin.com>
References: <20221122085046.21689-1-guozihua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122085046.21689-1-guozihua@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 22 Nov 2022 16:50:46 +0800, GUO Zihua wrote:
> The call to clk_disable_unprepare() is left out in the error handling of
> devm_rtc_allocate_device. Add it back.
> 
> 

Applied, thanks!

[1/1] rtc: mxc_v2: Add missing clk_disable_unprepare()
      commit: 5c1a0939b53b97ac090a82b9527160a5effbca87

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
