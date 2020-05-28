Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837CA1E6D34
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2020 23:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407509AbgE1VHC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 May 2020 17:07:02 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43307 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407447AbgE1VHB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 May 2020 17:07:01 -0400
Received: by mail-io1-f65.google.com with SMTP id h10so31763065iob.10;
        Thu, 28 May 2020 14:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KYsvXda3XgkhNdBAP6AVqd2JB2hppzPCUSeg0mKCGUA=;
        b=KBh8vaB5Vcvz5DO2qb+5LGsDRyqKyUzYhKJFZewQ+xTzIa0j28hg0Q+uUZRtOkGOCs
         r7+PYW6DkgBCaH7WBA2GczYLa5se7OoHEg4M0aoutolVhXpjSW6s7IWiq+ih1xNh8uae
         FJUMMUaLV2ispSp896V7/aFezZWZqw8mVcXS5PfbSi3iDF3VoFIqHr84cbLfk80BiM4O
         nq12B5KvK2N0R1Uxu8V9jAG8hUBEd5Osulh/0lxirbFcuwpAJ3+Ry+MT8Pv/Tp3UsYSN
         fwynIJWqwTeeaVXgJeguLD7+NSL1POD1bPpkdIN3aqjvAOEi8dSWafBna0cUPVcExNOH
         SuHw==
X-Gm-Message-State: AOAM532YBFIEuGepPbfSfvXUKerUt/oYnLTTxgSnWCFZ4qjGW7cAh2sH
        sBkFRlVfGehV0urL7fOaxw==
X-Google-Smtp-Source: ABdhPJwGQRZ685HPc6i/FLSVYo0eHCaCG6GkLjWsXM3/0IrFB1BBOJZIaHllnOO/IdC+cO34mee8Ig==
X-Received: by 2002:a6b:38c4:: with SMTP id f187mr3847001ioa.205.1590700019983;
        Thu, 28 May 2020 14:06:59 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u1sm2960158iol.42.2020.05.28.14.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:06:59 -0700 (PDT)
Received: (nullmailer pid 684627 invoked by uid 1000);
        Thu, 28 May 2020 21:06:57 -0000
Date:   Thu, 28 May 2020 15:06:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH] dt-bindings: rtc: rtc-sh: Add missing power-domains
 property
Message-ID: <20200528210657.GA684542@bogus>
References: <20200519074953.24328-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519074953.24328-1-geert+renesas@glider.be>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 19 May 2020 09:49:53 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm/boot/dts/r7s72100-rskrza1.dt.yaml: rtc@fcff1000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fix this by documenting the missing power-domains property.
> Update the example to match reality.
> 
> Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
> Fixes: 7ae8b2f5dfb357f0 ("dt-bindings: rtc: rtc-sh: convert bindings to json-schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Applied, thanks!
