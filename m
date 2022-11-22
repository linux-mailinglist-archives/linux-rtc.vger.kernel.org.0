Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9754B633D5A
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 14:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbiKVNQ7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 08:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbiKVNQ4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 08:16:56 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E67E43;
        Tue, 22 Nov 2022 05:16:55 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DB6B760015;
        Tue, 22 Nov 2022 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669123013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZMwT/FSkY5io09+90rBD+CBU928az5ldqanrkhXzXFw=;
        b=A7p2c+EDjDMBLWcxzM+gWwMzThQT/UtLb49GtedPu/BfA5+UGXSU90gY8OQrgxLX8OHpmP
        SYBRSwat4ySRRjkhDwU8Ss9gKgPTurZWzJkgpGM9i/rAQ/G2Dl9ZvIyTn1FWuLelUnvemw
        OlNNAp3y3Fczvn9XToVhHNqQeWq8HE2RzMCEimgJyowUi6+QU8KWLnDzLacaklo9kx+wzg
        3fDkMc3cyYXYoldOSwk9B8FbvfzvwozXrAzXEQ2FSB+5IYMiBZKN7dYDz9HJbtEu8HDV/+
        HXxrmGrz0gSlGqrqTs5zbaAKReoPcMIR/DJC9iRL365P0IWuP9BDlz1Ca4WHsQ==
Date:   Tue, 22 Nov 2022 14:16:51 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Message-ID: <Y3zLw3z0HdiySOgP@mail.local>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
 <Y3tEnxqWy6HCkpOd@mail.local>
 <AS8PR04MB8642503BF1172B707CB9F394870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <Y3tcix7xpgQ+kt9a@mail.local>
 <AS8PR04MB864255A4537CA5F23C49A6F4870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB864255A4537CA5F23C49A6F4870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/11/2022 13:45:27+0000, Jacky Bai wrote:
> > > > > Missing ref to rtc.yaml.
> > > > >
> > > >
> > > > This is also missing start-year
> > >
> > > The RTC counter will be reset to 0 after PoR reset, do we still need
> > > to add this property?
> > >
> > 
> > Is this really an RTC then?
> 
> Sorry, I think I misunderstand your previous comment. The 'start-year' is used to expand the rtc range,
> I will add this property in V2. Thx.
> 

I think my question is still valid, if the counter is reset to 0 on POR,
what is the use case?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
