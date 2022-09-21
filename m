Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7EA5BFFC7
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 16:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiIUOWQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 10:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiIUOWP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 10:22:15 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB49883DF
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 07:22:13 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7DBFF60013;
        Wed, 21 Sep 2022 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1663770130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=40ad+s16O0GfgV2M2ZamwNn2hpqph2cD3AxpYg508EM=;
        b=Sok9LG6fGee9AnZT5yyyXwX3vzDFrmJUDe77RdLwSuBCZHDhrl3ozBkSTDZ+iVtg3rqapv
        xFBAxJ4wwKfUhaZVpesRf1rjgs8mqRBZl/x37PLSvvs39NvNvpG3pmJyYl76LNNjIRebXF
        tZRB1Zzg7dtNZXa5OBg0R/2K3Dzu9/ykGMMpA+CQ+VuItjGfU4dpDqsnd5fruplIqHb1ZF
        aUA842tUWB1yubQTWhW+dg0GPAjE05ElZmZLC7wMcL3SqbfzCnWntkZsVxKPNCtoDOjWyi
        KeWCLDl4cd6cDKIEvrvdbxdLklaLD6nrMqt51iS4Du7G0ud/CZf3sr032r7SKQ==
Date:   Wed, 21 Sep 2022 16:22:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/2] rtc: rv8803 patches
Message-ID: <YyseEdX9/xuyKGka@mail.local>
References: <20220817085330.1050492-1-s.hauer@pengutronix.de>
 <20220921131753.GP12909@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921131753.GP12909@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 21/09/2022 15:17:53+0200, Sascha Hauer wrote:
> Hi Alexandre,
> 
> Any input to this series?

I'm not convinced this is necessary. Having an invalid alarm doesn't
mean that the time is invalid and that check will only ever happen at
boot time whereas V2F is a reliable indication that the time is invalid.

Have you really had an RTC with an invalid time that is not caught by
rtc_valid_tm and with V2F not set?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
