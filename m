Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6CB79328D
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Sep 2023 01:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238789AbjIEX3B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Sep 2023 19:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjIEX3B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Sep 2023 19:29:01 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C13B0;
        Tue,  5 Sep 2023 16:28:57 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7628F40006;
        Tue,  5 Sep 2023 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1693956536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zuWbjrK14FpRjBQ8BxeTR6DWVw5uS7OL9akdPs8EATo=;
        b=SoGVmDnJ8MJUTmi54q+/E2/76mmA4x14DKTqSssRzZ6oLn3/XeKkPyjzNmMjQ83llRff8H
        AC7jAbHyUoWFw+B9Y49evg1Rf1VsMEO2cOL2rI85o14rrBeBfXSxNZlRfofiQV2gr1j5H2
        1UwliN0Kjwm6PkRBg9+D4iOfqidU26xwPEQCbWHzWY3SBVs1exaWS5Q5TpxwY6vgrp2kKK
        ZPx16Mb8iHN+fXj35qyqOJh6WTIHGUg+/UQhRTVd/CeZ2NW8ncjzetvDXwxcaS9OizPSp5
        /Q5EuFgxAO+370v1F0xSQBnXdWc9cmdANg95oymSE+CV+XBEiS/BPrp6B/xs9w==
Date:   Wed, 6 Sep 2023 01:28:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: rtc: ds3231: Remove text binding
Message-ID: <169395650936.306948.2415359175774403273.b4-ty@bootlin.com>
References: <20230902134407.2589099-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230902134407.2589099-1-festevam@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Sat, 02 Sep 2023 10:44:07 -0300, Fabio Estevam wrote:
> The "maxim,ds3231" compatible is described in the rtc-ds1307.yaml, so
> there is no need to keep the text bindings version.
> 
> Remove the maxim,ds3231.txt file in favor of the rtc-ds1307.yaml binding.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: ds3231: Remove text binding
      commit: ce413486c9a0d735d86cc7d88660abeac99c2501

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
