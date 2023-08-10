Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9337771E1
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Aug 2023 09:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbjHJHsL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Aug 2023 03:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbjHJHsI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Aug 2023 03:48:08 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A20E1702
        for <linux-rtc@vger.kernel.org>; Thu, 10 Aug 2023 00:48:07 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C9321BF207;
        Thu, 10 Aug 2023 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1691653685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=97+K3wphXtML7cmc5tSJB1Ii6h2VIWFAIql1oZyFt48=;
        b=Qned/ZvMVctiJ8e4SYsUxxjJ/nY+6j8g1yqZz8vNPZSY7H4sR2JbiOlflwZcuv3qBjnEuz
        A7W3tGHtpOZe/dVutYPcdYkMikpRjzZ++SP8CMLTANFbNZLimkwvQjTWIBcus1pT2nXiAQ
        LRtnGSSkqSip9J06HiA1+hsTkUm2ELfhR9Rps2QKE4lNXodTA0lmkmgkAp5PGolyDdL81g
        BNRQeXnD8NucdcjSKLFDRzr8N/8944Iaa6/UCr3iF8/Q9SjkR9n/X73+EYXTAF5z2h5x6d
        3WwjMAsVJOTNy6xcqXK6AuFGfuHDoL1rB25i5FUy33c1n/3exRMJkVarkx25Bg==
Date:   Thu, 10 Aug 2023 09:48:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, a.zummo@towertech.it,
        joel@jms.id.au, andrew@aj.id.au, nicolas.ferre@microchip.com,
        claudiu.beznea@tuxon.dev, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next 0/5] rtc: remove redundant of_match_ptr()
Message-ID: <169165359721.972357.2241425230708767028.b4-ty@bootlin.com>
References: <20230808115213.154377-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808115213.154377-1-wangzhu9@huawei.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Tue, 08 Aug 2023 19:52:08 +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here. We remove of_match_ptr().
> 
> Zhu Wang (5):
>   rtc: aspeed: remove redundant of_match_ptr()
>   rtc: at91sam9: remove redundant of_match_ptr()
>   rtc: nct3018y: remove redundant of_match_ptr()
>   rtc: armada38x: remove redundant of_match_ptr()
>   rtc: at91rm9200: remove redundant of_match_ptr()
> 
> [...]

Applied, thanks!

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
