Return-Path: <linux-rtc+bounces-364-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57947FBCCF
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Nov 2023 15:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B65D8B21859
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Nov 2023 14:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118524F881;
	Tue, 28 Nov 2023 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrAkaISa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6704E18D;
	Tue, 28 Nov 2023 06:34:34 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58d98188dc0so944735eaf.3;
        Tue, 28 Nov 2023 06:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701182073; x=1701786873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMG48SwBK5UHsAZmvVGge+eO1O9aG82zKUQLg7KuJ3A=;
        b=TrAkaISaDFsf9QTCF4R7EN8cSm7eMOAYjOFBXxrz9YTAtDFlnukVJoXLhlcFqGX8xQ
         BzkToS8U/L0ZpYEuu6MTd9Gs+U1bM5iW3wbSpz6mjov3p+gnXvNSXViHO3XoJ2uhU3Cq
         wDhzVr2/essS5hMZXW8vcV8m4lpT8ToH9Uz8aZ+hqAMPQfyvJgoFoqoFYOJIdAea4Uvl
         CcAjhdgfB9DBCSuvBzqOiLscbKOoEd2SYjpuDbHHvmahW+90TA4iYpbZuSAf+PQnTFUx
         Jx0mVwBTVRR/dbNWaKX2MbrW66BH9T3H6eaXqdiA1xJ3hZ5leWikInFNdFMH6HXcm5ce
         Ul0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182073; x=1701786873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMG48SwBK5UHsAZmvVGge+eO1O9aG82zKUQLg7KuJ3A=;
        b=ERQnmb23A4yC8DDE8TxrUdGVe8jdyTYaVn954Edu+/98fzdBEmKEeoVeZysvJb+1B3
         wv+6RNfG24F61f39iptATcPRO4Q1MBhPe/c6sAIK4qgQtojVLma/EotJGE892SzuXAYn
         6/DZzq2tuzmPPrE7zAW0n2m/JQaIpmSCJDTErkoMkrHAj12u+qmN/opFzbDGHj7ItL2X
         XpaTVB3Vce2oQeogC7MKq3tOsth27daj8Py0dFEh4ETTR/XTmlPODoxiVKK8UXxibzcj
         rOgho+B52JGR2Kf6Z/TobJfSR80b87+2eAmx+uVu0ZC8EQM8xyWAgc7i59lQsI/rpDxJ
         1eGw==
X-Gm-Message-State: AOJu0YxVOfGinY7WQis2wQTX4gx0/fmUGGsfdP6kSEUYSDr9jUPVH1/H
	8R757AGbw8FI8GUgSbd+sSeWkyDF63crMZE8qSs=
X-Google-Smtp-Source: AGHT+IHzPkygydR5FCKAGeIxu2k+cpNdyTREovFpmnR+IYF8jBCyYIDp1Zft+jE6Elx/jhXtXOz/zAXUZQqbC70bm0c=
X-Received: by 2002:a4a:e559:0:b0:58d:bfab:f5f with SMTP id
 s25-20020a4ae559000000b0058dbfab0f5fmr454326oot.1.1701182073588; Tue, 28 Nov
 2023 06:34:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121094642.2973795-1-qiujingbao.dlmu@gmail.com>
 <20231121094642.2973795-3-qiujingbao.dlmu@gmail.com> <09b29f1f-a42b-49f7-afca-f82357acd4c8@linaro.org>
 <CAJRtX8TU9Z3OXL1zw9+mGNhxugp_C2jo40k-s9V2byNCQeBoLQ@mail.gmail.com> <438768a3-c50c-46f1-8a4e-2233c7545453@linaro.org>
In-Reply-To: <438768a3-c50c-46f1-8a4e-2233c7545453@linaro.org>
From: jingbao qiu <qiujingbao.dlmu@gmail.com>
Date: Tue, 28 Nov 2023 22:34:22 +0800
Message-ID: <CAJRtX8QkUFLnrGXHNH_StQeYy3cJZ6svcO4yz+cTC5x4D88mGg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rtc: add rtc controller support for Sophgo CV1800B SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, 
	krzysztof.kozlowski+dt@linaro.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, conor+dt@kernel.org, robh+dt@kernel.org, 
	conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 9:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/11/2023 14:22, jingbao qiu wrote:
> >>> +     if (ret)
> >>> +             goto err;
> >>> +
> >>> +     rtc->clk =3D devm_clk_get(&pdev->dev, NULL);
> >>> +     if (IS_ERR(rtc->clk)) {
> >>> +             dev_err(&pdev->dev, "no clock");
> >>
> >> This code is not ready for upstream. There are multiple things wrong h=
ere.
> >>
> >> First, syntax is return dev_err_probe.
> >>
> >> Second, you do not have clocks and you do not allow them! Just open yo=
ur
> >> binding.
> >
> > I'm not fully understanding here, can you elaborate more?
>
> That the syntax is dev_err_probe() or that you do not have clocks?
>
>
> > as there is clocks info like this in the dt-bindings:
> >  clocks =3D <&osc>;
>
> Really?
>
> Point me to the line in your patch:
>
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-rtc
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
>
> Where are the clocks?

I will fix properties.

>
>
> Best regards,
> Krzysztof
>

Best regards,
Jingbao Qiu

