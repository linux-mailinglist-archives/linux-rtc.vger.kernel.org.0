Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0351E35EFCD
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Apr 2021 10:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349790AbhDNIiG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Apr 2021 04:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345308AbhDNIiG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Apr 2021 04:38:06 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC89C06138C
        for <linux-rtc@vger.kernel.org>; Wed, 14 Apr 2021 01:37:45 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id g5so23441580ejx.0
        for <linux-rtc@vger.kernel.org>; Wed, 14 Apr 2021 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dg8FS+bLDkB10N5Z5KnKd2eYRzDk9ID1rsN2vEPTbU4=;
        b=GGOjZ7BVkPzalD3FUyVu39H4QrFG5tUQc1m1z9OkiFvXJSHHOUtcbZFJ2RMrgoL+M+
         t/E5EH1PteIEwws9YYapeHD4xmlg+U+MSAJj8hbHRA1a+5XrbsECm7PJdbIZhcYmtzty
         7ieyTaCKb5OfbrUuK1zqlam1HFoGG77x+btIa0uusnk5ImMtuWbcYqlyhYHDGl2CYj+b
         KIDf5KtR/hqzWDo51x7EVHRbr9qaf0iYKTo4MvtfExqrx5FgJrBMrZIAi35Jgvz7v+By
         wTK9LgjFUY/rZwvqg7GoCzMi2fStbj3qN3d12cb/GJumBG4kmscI5N3HG5B+bM0dm7Ld
         sg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dg8FS+bLDkB10N5Z5KnKd2eYRzDk9ID1rsN2vEPTbU4=;
        b=Ot2VczPln5UJu6mE9KWffVepBpovVj1jZPLhFiVOGnHZelTySKFYsjV6kbzBUwsgaw
         kI/4vuk1cU0XEsJ9n76K1IiOTq6KwD97ZcXti8wq/RQIB4Rvwnaln4k7/0PICT+bDUt4
         2Y9DfZb5ZtxJrDuT/VjB5c+wbxJAfnihg34nMREhk1tfo6ppVGNniJAZ2tl+fydPJ3ph
         Xl7iy/UHrJOrUIumTJ8G+syP71mxVAD8n4jMPb8N+yCLehcESE3LZS88NpC/SM/3Y40F
         I27XX73lFzVYoAh/YEI4q8hloB5BLaitoyllx5nO2gH8Xz7jU7sjCdf77YNzXsz56kkM
         bGRA==
X-Gm-Message-State: AOAM531+tRy+jay0/esq0e/qVe5vilbHh2R367btsQRWKE/SBe1Xby4w
        W7i9nuqlSKQ2aYdNvu3nZx96DQ==
X-Google-Smtp-Source: ABdhPJzcX935JREkGggRLRsEljVM25IyhSty1cnoTr37gYdkGR5gD6pU1kOHq7KK12mn7gdmhJ8Mnw==
X-Received: by 2002:a17:906:6789:: with SMTP id q9mr37394692ejp.295.1618389463848;
        Wed, 14 Apr 2021 01:37:43 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id n14sm6148221ejy.90.2021.04.14.01.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:37:43 -0700 (PDT)
Date:   Wed, 14 Apr 2021 09:37:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-rtc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org
Subject: Re: [PATCH V2 2/4] dt-bindings: mfd: Add compatible for pmk8350 rtc
Message-ID: <20210414083741.GG4869@dell>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1617976766-7852-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 09 Apr 2021, satya priya wrote:

> Add compatible string for pmk8350 rtc support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> Changes in V2:
>  - Moved this patch before conversion patches.
> 
>  Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
