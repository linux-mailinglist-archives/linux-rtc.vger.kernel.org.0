Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F27AB691302
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Feb 2023 23:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjBIWQJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Feb 2023 17:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjBIWQJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Feb 2023 17:16:09 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915AC9747;
        Thu,  9 Feb 2023 14:16:07 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E4573C0002;
        Thu,  9 Feb 2023 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1675980966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bmZ4qf0v+zRa7IzL4TRXLKC0lXMWWU+YZ+LDVP36KDo=;
        b=jbbbFqEiPGmPtO5FjY7NDjmFt3FNtYNKcRzLVLYYODpfqBVkMFBDaQpFaHzXeUXeCMzUqf
        sMpOtBknLmznygM46/uAMIAhl0jzp1VyYMXNMfvS4ypvxzEC6Z+OSx8/J7034+ugjuRpiq
        JKgDzu/EYS24nvBg8YFzpSjkmxcHJWo4ldXAK28CpGR6KPo/C4Q4FiDyyGfKcA+L+pQk0i
        mYhSSkTR+MrGo5K3kLN6SBn7tesCTfze/vk2zP/nqd8I7wTO15CkaFZLIi9BL62pF9WUeP
        syMLynVuAHrTRSlPDcYHb15BXxf6wdErclpY6vwRUX91pPAGuChH19e/WyWBEA==
Date:   Thu, 9 Feb 2023 23:16:04 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH v2] dt-bindings: rtc: Convert Amlogic Meson vrtc
 controller binding
Message-ID: <167598092747.1653817.3621933849168848178.b4-ty@bootlin.com>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Wed, 25 Jan 2023 23:24:24 +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson vrtc controller binding to yaml.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: Convert Amlogic Meson vrtc controller binding
      commit: 6a22a5dbc69473c2c46d1a13fe6cbc7bdaacb2a6

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
