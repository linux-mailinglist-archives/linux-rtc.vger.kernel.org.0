Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747DE28CF3E
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Oct 2020 15:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgJMNi7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Oct 2020 09:38:59 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34504 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbgJMNi6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Oct 2020 09:38:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id d28so9873ote.1;
        Tue, 13 Oct 2020 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NllhPoG9p2Bh0nH2RQW3ypX4VGMuvVMtCW/P5RE0rA0=;
        b=bvh5lseXETeaegLdBsfMsW7ASS/yLxwbQrG/JufbalSrBgn7yQZGo3HOZ+RyozcKXK
         LGpm1J2usz6fCmdhOL0iC4zrzuRF4DcH2FubZl10qiJfPF6uSp4B4S/DNXUjpS7DmLd+
         trqDQMPjFGTDLwMpNEH/6XvJBaYnF8ZHbyoWtMEl00cpVCKMc8e41yB7OlIeciQBC8VO
         Hqf+EyNYa4I7OojzM8tCd1llz9S2ttglCaNGATjcvQsK4bOuOyD+5p2sxEAan2WaO+fE
         XipBVQc+S497WEpQl3HM3INBeB4WIrXhqPNIIUHjuJ+4jzd2slU1qjr2VLRVQMoF3UPC
         DclA==
X-Gm-Message-State: AOAM533eZplutLIyFpsGZrSKfIR8syuoOpAa2cgjzaQUprmKanE4fEbe
        CkhNsIlNdiGkj95NEZfu9k9uvj4m6txQ
X-Google-Smtp-Source: ABdhPJyrwXGntpEdZUiYh7ZuK7r956WgYfc34tUuOK2H1np7c5kp3tOakK2wi1qnfd1YICxpqkfNvg==
X-Received: by 2002:a9d:d23:: with SMTP id 32mr15564661oti.34.1602596336779;
        Tue, 13 Oct 2020 06:38:56 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm11395102ooy.36.2020.10.13.06.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 06:38:56 -0700 (PDT)
Received: (nullmailer pid 3391552 invoked by uid 1000);
        Tue, 13 Oct 2020 13:38:55 -0000
Date:   Tue, 13 Oct 2020 08:38:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add trickle-voltage-millivolt
Message-ID: <20201013133855.GA3382613@bogus>
References: <20201007220506.360469-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007220506.360469-1-alexandre.belloni@bootlin.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Oct 08, 2020 at 12:05:04AM +0200, Alexandre Belloni wrote:
> Some RTCs have a trickle charge that is able to output different voltages
> depending on the type of the connected auxiliary power (battery, supercap,
> ...). Add a property allowing to specify the necessary voltage.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
> 
> Changes in v2:
>  - use millivolt suffix instead of mV

Try again...

> 
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> index ee237b2ed66a..93f04d5e5307 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> @@ -42,6 +42,13 @@ properties:
>        Selected resistor for trickle charger. Should be given
>        if trickle charger should be enabled.
>  
> +  trickle-voltage-mV:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Selected voltage for trickle charger. Should be given
> +      if trickle charger should be enabled and the trickle voltage is different
> +      from the RTC main power supply.
> +
>    wakeup-source:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -- 
> 2.26.2
> 
