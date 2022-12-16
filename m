Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2EE064EEF7
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Dec 2022 17:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbiLPQZI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Dec 2022 11:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbiLPQYT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Dec 2022 11:24:19 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5072026C1;
        Fri, 16 Dec 2022 08:24:16 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CCB896000E;
        Fri, 16 Dec 2022 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1671207855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=L69kiRuWyt6jCsskLC5eVS/oEkq/bV3fXgcHNTg0dME=;
        b=pqAjegCDEZQmgCGfPicjblO/Bg09wDEcFSQR5y+szDFZQ03CwfWtAbnHMciTRfx08wqHF4
        89pZkX7HT9LDwJXdYGtWyRQDcVwkYPILTSggMf6qLk92ILpbxOazPAeEjxcjr3kXYutKDN
        9SPx8vS+LpWIraSi0tYCuhLCiH5OF4kWmA4ZdYy6+dz1NvsvWqhlJWYhY+dRKSXob786yy
        1w4Ii+Zq2jJJZD4pvs2OBn7G2ACACY/8HywbnfdqJ/lUbUOiWKQ5QrZ2iuEvLtYmNMJvqn
        rfKcKYay4H9RT0Yz4wVvZYLGCDg7ghXAC4vA3v2ZnrdK5Pi1uTu3exI6IFEsDg==
Date:   Fri, 16 Dec 2022 17:24:14 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: rtc: m41t80: Mark the clock: subnode
 as deprecated
Message-ID: <Y5ybrlxIH4zYpaWZ@mail.local>
References: <20221211205124.23823-1-marex@denx.de>
 <20221211205124.23823-2-marex@denx.de>
 <20221215180659.sa54lkinwxoiz7bb@mercury.elektranox.org>
 <d9910a7a-9997-c157-9a71-8ef7ee34be25@denx.de>
 <20221216142408.6x3e5dhtdvgiewtb@mercury.elektranox.org>
 <f65773a2-71a7-6d54-1ac2-9987ed035b16@denx.de>
 <20221216150548.dttzfmdbqzk6r42z@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216150548.dttzfmdbqzk6r42z@mercury.elektranox.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/12/2022 16:05:48+0100, Sebastian Reichel wrote:
> > > IIRC On i.MX6 referencing the I2C connected RTC results in boot
> > > hanging forever when trying to get the ckil clock in
> > > imx6q_clocks_init. At least it used to be the case when I was
> > > working on this - I no longer have access to the boards. Of course
> > > properly referencing the RTC clock was the first route I tried.
> > 
> > Hmmmmm, what shall we do, un-deprecate the clock sub-node?
> 
> Depends on the exact meaning of "deprecate: true". I think we all
> agree, that it's better to avoid the sub-node and only use it when
> it's really required. But having a deprecation warning for an
> in-tree user without a clear path forward also seems to be annoying.
> I think it makes sense for the DT binding maintainers (Rob/Krzysztof)
> to comment on this.
> 

I dropped the commit from the PR I'm going to send Linus later today

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
