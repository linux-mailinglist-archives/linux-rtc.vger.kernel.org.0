Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7662761F4
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Sep 2020 22:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgIWUXX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Sep 2020 16:23:23 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34947 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgIWUXX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Sep 2020 16:23:23 -0400
Received: by mail-io1-f67.google.com with SMTP id r9so938146ioa.2;
        Wed, 23 Sep 2020 13:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=74V+NsbplZZwMp3cMHm20AsyNUA35OCxRNt45d7WD5A=;
        b=ZHTt7BM0NraT+kbNu9oBoW2jeZfuR4ZHSYJf03KrMFyTp0BeayGy2geg2af1UXfbyV
         6JbpGv9BftiMbKcLXNn+PZM3ruXyt3u7OCxuespUVgO2/wLgpBRxbdBCmo2e4tQsncYj
         tIk3x2FWiaTxScykZ4jX03zkaZO5vuSnHkyygC8zjRb24aDqFbhwKOU8U2Ep7ZX/cIYN
         GkeXn0sp7adUr5qFOIIuHbNykz3z/Q3kovCWfK2oE5qZtkFdAOABrlwBvitfmKeINm78
         yOpQ/kHznF/7QpQ101nju15hHFRBx7n49/v9ttisQrkA1oWGWeb4FxI4kjZ4I6UdR3Pm
         Rx1A==
X-Gm-Message-State: AOAM532EtpsDHPM2pJNkrVeeaDUts+mR18029IP0P+1rVM1/8a+b/zma
        8fQUlJdVsiJIQNcR1JpqJQ==
X-Google-Smtp-Source: ABdhPJytChPMi9q/zTTLZOuZmHm/WNcA2QdoQzabP5UKHFd+l100KsZAy5z6Q1X+sQFPizFHn5NRIQ==
X-Received: by 2002:a02:9f0d:: with SMTP id z13mr983884jal.60.1600892602342;
        Wed, 23 Sep 2020 13:23:22 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n11sm395768ild.3.2020.09.23.13.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:23:21 -0700 (PDT)
Received: (nullmailer pid 1239885 invoked by uid 1000);
        Wed, 23 Sep 2020 20:23:20 -0000
Date:   Wed, 23 Sep 2020 14:23:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     kernel@pengutronix.de, Arnaud Ebalard <arno@natisbad.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: rtc: let aux-voltage-chargeable
 supersede trickle-diode-disable
Message-ID: <20200923202320.GA1239822@bogus>
References: <20200917183246.19446-1-bst@pengutronix.de>
 <20200917183246.19446-2-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917183246.19446-2-bst@pengutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 17 Sep 2020 20:32:39 +0200, Bastian Krause wrote:
> Some RTCs can be equipped with a chargeable battery or supercap.
> Every RTC allowing this whose driver's implement it are charged by
> default. To disable this the trickle-diode-disable flag exists.
> 
> If a driver did not support charging and some time later one wants to
> add that feature, there is currently no way to do it without breaking
> dt backwards compatibility. RTCs on boards without the
> trickle-diode-disable flag in their device tree would suddenly charge
> their battery/supercap which is a change in behavior.
> 
> Change that by introducing aux-voltage-chargeable, not as a flag but as
> a uint32 enum allowing to set "do not charge" (0) or "charge" (1). This
> dt property is optional, so we can now distinguish these cases.
> 
> Care must be taken to support the old behavior for device trees without
> aux-voltage-chargeable nonetheless to stay compatible.
> 
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
> Changes since v1:
> - fixed dt_binding_check error by adding " |" after "description:"
> 
> v1 notes:
> In a previous series aux-voltage-chargeable was added as a ds1307 dt
> property. Discussions lead to turning that into a generic rtc dt
> property:
> https://lore.kernel.org/linux-rtc/98fa7181-3ebe-d7c3-cfac-fee841c81e15@pengutronix.de/T/
> ---
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
