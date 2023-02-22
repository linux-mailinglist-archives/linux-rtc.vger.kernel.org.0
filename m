Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB6869F374
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Feb 2023 12:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbjBVL1G (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Feb 2023 06:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbjBVL0s (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Feb 2023 06:26:48 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FD53402B;
        Wed, 22 Feb 2023 03:26:46 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 280BB60008;
        Wed, 22 Feb 2023 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677065205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GYRyDjIKOuBn7rlL04dOIgsaZRayXDFgVeFzONhP5pc=;
        b=EMdXHgpxkuAkCAF4NHoU9J+0+xjS2QGGDmJQel+AMDFVJpAlkAGkNhS2nrwa1p6qg+WL7C
        Lus7XL/NRpCfLf1Y1LJAydXoPAWEEcQB+MQUIv9mSiADeQCbJa0Qi4c7BsI8fjpIXJyKOz
        ZLcAh6kTzCuX8NmuO47LgENQGagDofmRE6mAyvQkibyBoVAYP2TNs1EPJBmuvuhFhbB67V
        cKRoCoY63Nba8WKbviPJaMtKM6aZAigkjEmGfvu10kbSIZhFzZNC7sJoYHc4/AGhJlSTFW
        aaRX7tE4NDkzx99AbyPxd4ru964B+3i7A5s+SbZHt+5fVeDz28aSDabszrEedQ==
Date:   Wed, 22 Feb 2023 12:26:43 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, Jacky Bai <ping.bai@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
Subject: Re: (subset) [PATCH v5 2/3] rtc: bbnsm: Add the bbnsm rtc support
Message-ID: <167706506518.20821.8283939854072487426.b4-ty@bootlin.com>
References: <20230215024117.3357341-1-ping.bai@nxp.com>
 <20230215024117.3357341-3-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215024117.3357341-3-ping.bai@nxp.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Wed, 15 Feb 2023 10:41:16 +0800, Jacky Bai wrote:
> The BBNSM module includes a real time counter with alarm.
> Add a RTC driver for this function.
> 
> 

Applied, thanks!

[2/3] rtc: bbnsm: Add the bbnsm rtc support
      commit: eb7b85853c3866236f9cb378fc68ce5f76efbf9c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
