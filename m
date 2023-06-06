Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A79BE724ED0
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Jun 2023 23:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239745AbjFFVaP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 6 Jun 2023 17:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239762AbjFFVaL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 6 Jun 2023 17:30:11 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A160510FB
        for <linux-rtc@vger.kernel.org>; Tue,  6 Jun 2023 14:30:10 -0700 (PDT)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1686087009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yPc7g0OE+NGmFJK9qpx6ai/Y8FPstWuCkZWN564PldA=;
        b=j0jR711+B0S2O/2MwtZSHbTJ2c4GTmUb7zj4Ig3Ewgj1JsuRxp2pBdNWJhUSay89xl5Vqm
        5TKlP/LUIodAo9Ku98arYuTYdpZ2RbWW9g5xxQKQ7qnp0MLCJWfw4QlEhPxGmQTwz8j+/a
        aE574q13rxGoV7Bw2JkR99jOPmvVKL/qWmyXcKQDWCifpsezjOjMuUdskHZ7HkFFp/G6/h
        1fyqIN+GcAPpTEAM1W44n3sVsiPANPmo1Zlzzmv5WFahU3KK+BnmUjfdDGoEF+8G68Uiy+
        7EWYw/SWIaZjU88415m3RN2nmd5imM5TFomJAjwE/tS/4lIAfV38L8oghIXhQg==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0EC7FF80B;
        Tue,  6 Jun 2023 21:30:08 +0000 (UTC)
Date:   Tue, 6 Jun 2023 23:30:08 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] rtc: Switch i2c drivers back to use .probe()
Message-ID: <168608698320.28775.5939921325619549910.b4-ty@bootlin.com>
References: <20230505121136.1185653-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505121136.1185653-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Fri, 05 May 2023 14:11:36 +0200, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc: Switch i2c drivers back to use .probe()
      commit: 31b0cecb4042d2676fd48f09379a19bc8b16eadd

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
