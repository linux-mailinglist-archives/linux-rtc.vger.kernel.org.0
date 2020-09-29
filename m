Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2419227D4D3
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Sep 2020 19:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgI2RrV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Sep 2020 13:47:21 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34120 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728386AbgI2RrV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Sep 2020 13:47:21 -0400
Received: by mail-oi1-f195.google.com with SMTP id n2so6406822oij.1;
        Tue, 29 Sep 2020 10:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KZRMr4mdPoTh1ehZPsE7EnlMD2nYYqtZbdCYkxjagbE=;
        b=dB8Npl7BrpwBuK1lmIXghK6uDGdDcqf6um8q4ZbG4hor2kAKfL7xTs1n39do8M0isp
         FPy1PAa8FA9pBmAos3pZO+ZVLPSSGvdchtcX3GNI0Y4K803nkfODxaBinNngm1Fi4ynn
         sATs1drrpj5Jy/r45W8iIhxQeMwW1g41cTCeYkaTBixnpk/+49Odp+a0UZ4HW+HFDDJ2
         uCfAPMp8ZjUgRYopN+IDePOptRNZHKC8sfq6JccFsHmfqZQ0JsDuqlUXABrpFpjSx+gw
         dtl3SiqVgCylJtwSVAZafpuT4RpBXQz3eHWjn7AJgL6EyK7iK3pUwi1s0ueG48M2NFP5
         HT1g==
X-Gm-Message-State: AOAM533HzM4aogua7dqLzphrjBkBddYlyl5dV9Nu5ZsIUNUEZ2skv1JI
        YDFPPtn8pTWI4ptosvygfqSco+f55ehN
X-Google-Smtp-Source: ABdhPJx3wYtz1WxeOXO3Dnbowx1BLv+z7vIPqs4+VSQ7rQkYVfJD1gS7+GWYeJddpk/hnScGZjG13A==
X-Received: by 2002:aca:3655:: with SMTP id d82mr3433472oia.75.1601401640217;
        Tue, 29 Sep 2020 10:47:20 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l23sm1146271otk.79.2020.09.29.10.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:47:19 -0700 (PDT)
Received: (nullmailer pid 849102 invoked by uid 1000);
        Tue, 29 Sep 2020 17:47:19 -0000
Date:   Tue, 29 Sep 2020 12:47:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: add trickle-voltage-mV
Message-ID: <20200929174719.GA847795@bogus>
References: <20200921171735.1191342-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921171735.1191342-1-alexandre.belloni@bootlin.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Sep 21, 2020 at 07:17:32PM +0200, Alexandre Belloni wrote:
> Some RTCs have a trickle charge that is able to output different voltages
> depending on the type of the connected auxiliary power (battery, supercap,
> ...). Add a property allowing to specify the necessary voltage.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
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

Use standard unit suffix.

> +    $ref: /schemas/types.yaml#/definitions/uint32

And then you don't need a type.

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
