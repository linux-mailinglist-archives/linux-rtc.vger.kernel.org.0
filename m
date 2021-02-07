Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C10E3126F0
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Feb 2021 19:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBGStT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Feb 2021 13:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhBGStS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Feb 2021 13:49:18 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6431C06174A;
        Sun,  7 Feb 2021 10:48:37 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id y18so15591661edw.13;
        Sun, 07 Feb 2021 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EGUleL2eUhQNkqgdSNGHaB4lMTeXgM8GYS8mqXoep18=;
        b=ToR10LHsn60YUDp2DP0hDjaXCyVzc8zWU/NGOLWEgKHS6gMxtdfHAMZ6v3cS6X0/iY
         aZwv5NRsuqKhCHL0rJMZX+249h0GhfVmma5wrykmnWvvGkZA1mHvIEORbNp5IKyPx1R7
         47IGQ16ETe9b+F4QIb+C5P/JwoY+vv0K3Vzn1umWLIBVY+eKNZSTJIkzD89xhjqn+mF3
         UeY+vdZsEvvSLhf5zMl3eweZVvJ8gQ/AZEVlLre/YN1LNTwHJE9ErIpyR1+rmASTrOnV
         mDbZaSTdvK4AdIeqguB8QY/JDaKUe1YwXadFwDC0rB684zoN3pZTw5ABoJWssinMRv9Y
         GUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EGUleL2eUhQNkqgdSNGHaB4lMTeXgM8GYS8mqXoep18=;
        b=C/fSQjKc2o96F1ABaq29HFLMyyfPXdcp3dKy9as6e7Tp1QN+1rCqJh/F1lcj6lCJe/
         8zViHCvyAWfQ0Gv2GrtCf8rMBdbVmtbcsGpq6bD0/imVryaY/sRdug5RxXzkgSIhNbYA
         xEOzpANagMOtmOujIDv5cmPxStZUcGQru+eTeYFzxRBhfCQWsvyV7/geVqkcq8R6xZvz
         ujdxbQacSBRCU7gtMAfNXWU0auUS5vHyw6NnKqW6xsHgTlp/Hm2LG1h6teWQC0XrvxP4
         jaSZtBbF256Ln7L5Tmzg12QFnECartz+kmIGVyAvu6uoa+d4ugelJb316opnAuN1/fjS
         X5OA==
X-Gm-Message-State: AOAM533s8mX1FJr4G64XKNKQKyyHiyAIFEWa/Zj9GhZAwYZvH+bXfxMT
        EJ/bWe/lFfa6iF4EwCIMEW89L28iij4X5w==
X-Google-Smtp-Source: ABdhPJw0mfAfPKKjiEL+LasOhxLInAfCF/IyAaxDCVbPW22DiVvyPcta0oxPzyEwqia1eDWJFUublw==
X-Received: by 2002:a50:d6c1:: with SMTP id l1mr13873785edj.336.1612723716670;
        Sun, 07 Feb 2021 10:48:36 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id bz20sm7383803ejc.38.2021.02.07.10.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Feb 2021 10:48:35 -0800 (PST)
Subject: Re: [PATCH RESEND v5 8/8] arm64: dts: mt6359: add PMIC MT6359 related
 nodes
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Fei Shao <fshao@chromium.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Wen Su <wen.su@mediatek.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-9-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1cbf58f1-376c-fa93-98a2-53a41fa24273@gmail.com>
 <CA+Px+wXP2vrFbou+SCRZuXYr4XPPxYHZfk+oSM7_GPXZSD24UQ@mail.gmail.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f0ed6a53-d2ee-4699-10c9-e2d937f0ff60@gmail.com>
Date:   Sun, 7 Feb 2021 19:48:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CA+Px+wXP2vrFbou+SCRZuXYr4XPPxYHZfk+oSM7_GPXZSD24UQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 02/02/2021 04:51, Tzung-Bi Shih wrote:
> On Sun, Jan 31, 2021 at 7:06 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>> On 29/01/2021 10:49, Hsin-Hsiung Wang wrote:
>>> +             mt6359codec: mt6359codec {
>>> +             };
>>
>> I understand that the dmic-mode and mic-type-X depends on the actual board on
>> which it is used. In that case I think we should add mt6359codec node in the dts
>> instead of dtsi file. I'd advise to set these properties as well as otherwise we
>> get a (slightly misleading) warning in the driver.
> 
> I feel it is better to include the node in dtsi to represent the whole
> MT6359 PMIC.
> 
> We could either:
> - Set default values of these properties in the dtsi to avoid the
> warning message.
> - Or https://patchwork.kernel.org/project/alsa-devel/patch/20210202033557.1621029-1-tzungbi@google.com/
> 

As this got accpeted upstream, you don't need to do anything about it.

Thanks for the pointer.
Matthias
