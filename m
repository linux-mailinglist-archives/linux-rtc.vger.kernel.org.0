Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BC43E0064
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Aug 2021 13:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237804AbhHDLoL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Aug 2021 07:44:11 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47278
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237793AbhHDLoL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Aug 2021 07:44:11 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 2D0BE3F0FD
        for <linux-rtc@vger.kernel.org>; Wed,  4 Aug 2021 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628077432;
        bh=IJJ9u6xsB7o4yD+uaxt5D1D9VxpMca4V2zhEM+FKQ2Y=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GG6H3dfABm3dQPtLrCf6ZkXcSHyc+juNiCrHoctFxmbzM0TRZwpEnMeX6mqITizx+
         lykirw934dvf+jjOU8EBOSFOwNaw0L9Occ3jsctGN+o9nn/22nh+lwIQaTjPlPEe0Z
         piZ5AHJZ5efKotKDXEZ1o6wNh5XA9j8pCI7Z7LpcDDn7AN6tXZ5AI2XLlRNq+8duua
         l2UzR2v5jjYMbZWMRwX+nqcREcrfHVpMG8FSf1g6Kepdxjoi1UJhzEuaJR+YgTqNUf
         SXLEODOpqiD9G0WJUeolPn7Uj09MwIQSJWeug/X/GvN8ZxGAwlEgMtqsXqBwIimLZC
         fRSFPeTUA4Piw==
Received: by mail-ed1-f70.google.com with SMTP id y39-20020a50bb2a0000b02903bc05daccbaso1321084ede.5
        for <linux-rtc@vger.kernel.org>; Wed, 04 Aug 2021 04:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IJJ9u6xsB7o4yD+uaxt5D1D9VxpMca4V2zhEM+FKQ2Y=;
        b=FFJJaRYmdjGVctbP7zTnz6mfZ2nyGDmP+cym+C/Cs/lzEnLYhsg52UoyiVZblJKOAt
         H/YDwzLYtJx41SXGd3qFBh+Tpz9iV5ziAXWZ/fZSuQhfrgkwf98IoILIBi5PXYMvZ1NL
         A8SgcQm6xDydzDCT+63sZxQzmUaVSn/ip5cabcISJnXWInRNwwZirECYS+bfSjENpgLb
         /E+XVMtMPSDyU2TX6rDCi4l1IdcGqQT+AefILuzWlJz1wCBhwBaXAb0kk3MWmvdeNiz6
         RFqDuh2Wrq8mGeNDbnwg4QL0Ij+AbdOZ0r3VwWcddosYfTANYmk4Df/sgDgQQbwnH5do
         gvfQ==
X-Gm-Message-State: AOAM532Ey3ju67brq1Ga14b4mwQ5mT3eVDY4SQxwZmlJv3fMy4RwZR75
        qPlFDQK1Ms9YA75f4MGrxkwqa5rc8fSXYRCcTT/KK4z/najLCqGTOrvKQBtBMRRt9aLoMMM8Mzw
        LC4KOJqZJWUjvy3XyEmC7Vs4ShtvpdkwJgVABBQ==
X-Received: by 2002:a17:906:d153:: with SMTP id br19mr25810880ejb.166.1628077431935;
        Wed, 04 Aug 2021 04:43:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVZOjbXn9WfuE7/WcRirprZx76g0Ffuu/eG4T05Y2gR98mddFwJpsASAbyPCUipBmseRl3eQ==
X-Received: by 2002:a17:906:d153:: with SMTP id br19mr25810872ejb.166.1628077431843;
        Wed, 04 Aug 2021 04:43:51 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id m20sm841016edv.67.2021.08.04.04.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 04:43:51 -0700 (PDT)
Subject: Re: [PATCH 1/4] rtc: s5m: switch to devm_rtc_allocate_device
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <444fbb25-c926-a685-08e7-f7f8e54f7cc7@canonical.com>
Date:   Wed, 4 Aug 2021 13:43:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/08/2021 12:41, Alexandre Belloni wrote:
> Switch to devm_rtc_allocate_device/devm_rtc_register_device, this allows
> for further improvement of the driver.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-s5m.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
