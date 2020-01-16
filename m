Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5307413DC03
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2020 14:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgAPNbt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jan 2020 08:31:49 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39580 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgAPNbs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jan 2020 08:31:48 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so19156842wrt.6
        for <linux-rtc@vger.kernel.org>; Thu, 16 Jan 2020 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=92j60HxqCEoOKu+L2rR0tiLdjI3nwfWARg8KDYeQ1Hc=;
        b=qk6nnIvTtbXj8z3WH8gRV5cDnpDpuGi+k9gfNf1M5gPU/SGXQeF/OouzDTCtsNTspO
         jyP6vddeW+PKwwlJcW1RP21/2yahoHU1oy+mijDa2/YmNpFjQnN+Nw5ZVbe0AWOQ8MSL
         HBq+5c4mm6oTtx2gT0pdFAPlhYfXLZEfvcZosCXRs5amTmpo77tfKqiIsleJOfsQjgga
         N44KBEzn3cxNeeG/4wciOEzUQeA0kvBvBXm4m5SY6lBEh9Z2QmrSoJhbikrjDyvbLnCJ
         IBP5kISG7AL6GQlWy1nJ2oOGDn6FNgcRO4ZaczOg9Ptv6lg4qvqOhbD6ZkzIKeekalBk
         w7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=92j60HxqCEoOKu+L2rR0tiLdjI3nwfWARg8KDYeQ1Hc=;
        b=ngLZBdtGMoOOtng6bLShZgSki+QMGRiQ5ajs5033rDWKMIif4D67JtBesMHd5K0DFj
         Lhy0fQSAwj+l7EDx9nDQg3VkgznjzTi/+MBVKSD6TblSRBn4lJfyEwHH045SwUUYFg6G
         GZPsyBz1W/w0A6GHBHgERRNBMrSKXTdzyD5YeAx2heiPmGB8FZ10Bams2W6K6/PwVP9J
         +n2xNqg3yLmXEwSO+f5ye27adIj2+WUmQC2gw5LSOFzqeiTwzmOUFzk/ub/HIbcERz+D
         mnsyFtAPlkNjX8L7uLwf7C44hFr1JLoAhMJOKwjBfg4rOMEAuE/DJZLM6tf9txLUydjq
         V8Gg==
X-Gm-Message-State: APjAAAWgGj72u7BGAwJowMiLzOdhUpaeuO6ciJ9N4jsKRht4kfdm7HqH
        IeKCO3T78Dr9Rsd13BpdzzHXWQ==
X-Google-Smtp-Source: APXvYqwlMDSGPaX00R2t+Jwt5d47l+TNIJ+hn5XsewXTyhaLBWjnyKNucc5zVRNV2/RZ5WqI12aE5g==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr3190596wrt.136.1579181506919;
        Thu, 16 Jan 2020 05:31:46 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id s3sm4550461wmh.25.2020.01.16.05.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 05:31:46 -0800 (PST)
Date:   Thu, 16 Jan 2020 13:32:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: atmel-usart: add
 microchip,sam9x60-{usart, dbgu}
Message-ID: <20200116133204.GP325@dell>
References: <1578997397-23165-1-git-send-email-claudiu.beznea@microchip.com>
 <1578997397-23165-6-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1578997397-23165-6-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 14 Jan 2020, Claudiu Beznea wrote:

> Add microchip,sam9x60-usart and add microchip,sam9x60-dbgu to DT
> bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-usart.txt | 1 +
>  1 file changed, 1 insertion(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
