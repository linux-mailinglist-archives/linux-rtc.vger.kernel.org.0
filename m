Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F84765DBF
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jul 2023 23:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjG0VIx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Jul 2023 17:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjG0VIw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 Jul 2023 17:08:52 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBF630DE;
        Thu, 27 Jul 2023 14:08:51 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 256D860003;
        Thu, 27 Jul 2023 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1690492130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xB2LVg7xjVx7i7+P8a98bERdBjPfGDC961GCneecdyY=;
        b=TlcAIDo8d3TNuUdCV4ju/wYmf6W1zdahAxg9Q7gMsBadlOU6rniEWSC5C0EQJ7Vk05TUSn
        i1CHOhS1tdSHOmRczVV0G7/gNEiZJSe0lss2CPolJyYHvCII+/6fQ41XlQGxbfKuz0d2kf
        /9R/2f+5fEftslgJ1zu2H4nC/bm6/9G0+HCmxyGIytud5Wu9W2OHItZdy+RU4qEt70RmSj
        GVe0Hw6TWLfhy02bRL6cfqSRgSgm3bMf1tUzQoe2n+HUJMtgLTO50iuT/JSEamivWuFnrw
        cCSW/AlLfZcTlE0XHB5H0k/fCHuN76dyjPTIvkhSvPOqER0njDcomYpAbkKb+A==
Date:   Thu, 27 Jul 2023 23:08:48 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pcf85063 driver improvements
Message-ID: <169049207820.464219.2014756429381983853.b4-ty@bootlin.com>
References: <20230717124059.196244-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717124059.196244-1-biju.das.jz@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Mon, 17 Jul 2023 13:40:57 +0100, Biju Das wrote:
> This patch series is based on the code improvement work done for
> rtc-isl1208 driver and is just compile tested.
> 
> v1->v2:
>  * Added Rb tag from Geert for patch#1
>  * Added patch#2 for dropping enum pcf85063_type and the array pcf85063_cfg[]
>    as individual variables, and make lines shorter by referring to
>    e.g. &pcf85063_cfg instead of &pcf85063_cfg[PCF85063].
> 
> [...]

Applied, thanks!

[1/2] rtc: pcf85063: Simplify probe()
      commit: 68c624f860b30408afde81a91b4c9df3e915ed85
[2/2] rtc: pcf85063: Drop enum pcf85063_type and split pcf85063_cfg[]
      commit: 5789837c782771eadc9be47487067399609832e7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
