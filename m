Return-Path: <linux-rtc+bounces-3912-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF6A84797
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 17:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E0F178896
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 15:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F6E1E1A16;
	Thu, 10 Apr 2025 15:18:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8638714884C;
	Thu, 10 Apr 2025 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298293; cv=none; b=BnyE6rZaCuRQfXhQa40ocPeUKsPg5U4cKyvH6u+5hGu0P+/9aAkzHaCpgsviHJxnoiW8DyCbGeK6Sec1cnbroXarxa+0eAkaUFEas2LxUJt4WzOsug4rwO0xBBLiryWh1y+Y+2gneam/DEQcgIqcGySysuRAwHPcAgUZ8fElhWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298293; c=relaxed/simple;
	bh=8rnwDyXBmuoXpcNcTExrnIR9+neRo7+CtWvJs/v9X6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvLcpMTaKVRXFC/tn3vyD/saXVGqqFaw0MopPwMYfm9H3N6vVcL/hIEWGtw5HvMIlnyZElHI2uKyPLRM9rdGLj7gzqfJAt0EeljqpV11YoD0DOMrkyzP4V2Tg7G+mePQ6BxvSo6WhPS7ysMC9vJUIdj6Yr80cP8tks5WdFP1PwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4772f48f516so19593521cf.1;
        Thu, 10 Apr 2025 08:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298290; x=1744903090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE+ZNNwn35q6sEirTxJ6ITtGz6eW3uJTMf9z7a5BBT0=;
        b=DgydAxQpGM+PTh2ReEmLbs1NixK/q2mDe6xd41+3cSjK/a/5j4JUMMMs2i5Lmbh2hF
         XOnCMKtD1YfOXSJs9xoLsbMYgZHgDeuQiPnVWkCQaqgsT36z+piCuhJW0TNPEt+NsWxz
         zUaNGiLCdpWkwg1bDSAKz47Mut7t9Fd4p32T2QM4lk4FF+BZCiuAzBQ2rfMVQWE4yBP+
         C0mV4izV9i6pqvuWVjBrndxBXPemVbUuf9S7BkpKXmywS1gNBc/4Gbk94h4hfmcyIIZg
         Er6wp7wgOI4XrDTC5dshjNTo0/jdm7g4bj6VdsAU4ceD7KAPS2MJGf3PQF1umapkpztE
         PDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4OS5bgW0IROuCy0xAcL0+qT412qeEKPryw+b/HKOfyGUc/B+ME1XohHgJpYVk64M9iR87hL62LK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1LlR9enr8IgCaMSpoU/cumxU/kQVEjktYWQhC1+MSjXkZmt6
	cZaqg3/FV370XI2ZtIjKlh9XyL3UjaeHcZ2cZkal5vgkB0i8HpIHfY9+G16R6VA=
X-Gm-Gg: ASbGnctZ07aKISDBFEXSeYvd0FMzjr01ErGJcMxnpvFAIvTkYEmlpoD5sYuOzIWwgYo
	cshugHrGcRpN9VjJOTUyetGe04f0upFXsbccQgfcOzj9IDluu9FsD0rA+1F9KE9RUs40TfeQxmi
	Clodlt84okEJj2p6oJyJBGBUMgaYlfTW8u6KMn5jGnYpwol+dchgw136zpOUssAuAOzOtZmJQ4q
	nJ9+OfBz8aGLizyk5hqh7cJP2PFpokMiauNpTrxnwU38t84u71PdByzX415dMM8xRDkhX3MmdV+
	Mtiz6O0kHxeT0l0YLayD1KPix+f2Nu2sWEOs5aGNIGcszDWzcrxQXZluyO9CYuMlxJI1DyJsPDW
	I06L9wKM=
X-Google-Smtp-Source: AGHT+IGMxiEDkU42OKu8yQquMx0C9NVeCoFNrd3ouuXMD97Dmn+jJGO4ivwl+60BmBK9k/9ytcgGJw==
X-Received: by 2002:ac8:5891:0:b0:471:9e02:365e with SMTP id d75a77b69052e-4796d08756fmr46235621cf.8.1744298290054;
        Thu, 10 Apr 2025 08:18:10 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb163e4sm10176381cf.31.2025.04.10.08.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:18:09 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c592764e24so98117885a.0;
        Thu, 10 Apr 2025 08:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0zZNv2HLAcJWgDwCyh+YYziMhrAt/pxV5H+42JumiYO3G5lPVPt8tXev6XngEtmcvH0j+K27hqMk=@vger.kernel.org
X-Received: by 2002:a05:620a:280e:b0:7c5:6b46:e1f6 with SMTP id
 af79cd13be357-7c7a764cb2cmr490762285a.1.1744298289676; Thu, 10 Apr 2025
 08:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com> <20250319110305.19687-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250319110305.19687-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 17:17:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMPnJ9b_5gZ4SwCAeuHUTr3y92+d94X=os5HaYis1CTw@mail.gmail.com>
X-Gm-Features: ATxdqUECxGDGeGAKYde71Ob1sRH_YXk5Fi5VnTcBMX1P716KbYu6RCYQy0QIZTg
Message-ID: <CAMuHMdXMPnJ9b_5gZ4SwCAeuHUTr3y92+d94X=os5HaYis1CTw@mail.gmail.com>
Subject: Re: [PATCH 3/3] rtc: rzn1: support input frequencies other than 32768Hz
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 19 Mar 2025 at 12:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When using the SCMP mode instead of SUBU, this RTC can also support
> other input frequencies than 32768Hz. Also, upcoming SoCs will only
> support SCMP.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Suggestions for improvement below...

> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -404,10 +405,24 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 return ret;
>
> -       /*
> -        * Ensure the clock counter is enabled.
> -        * Set 24-hour mode and possible oscillator offset compensation in SUBU mode.
> -        */
> +       /* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
> +       xtal = devm_clk_get_optional(&pdev->dev, "xtal");
> +       if (IS_ERR(xtal)) {
> +               ret = PTR_ERR(xtal);
> +               goto dis_runtime_pm;
> +       } else if (xtal) {
> +               rate = clk_get_rate(xtal);
> +
> +               if (rate < 32000 || rate > BIT(22)) {

Perhaps

    #define RTCA0SCMP_MIN    32000
    #define RTCA0SCMP_MASK    GEN_MASK(21. 0)

and

    if (rate < RTCA0SCMP_MIN || rate > FIELD_MAX(RTCA0SCMP_MASK) + 1)

?

> +                       ret = -EOPNOTSUPP;
> +                       goto dis_runtime_pm;
> +               }
> +
> +               if (rate != 32768)
> +                       use_scmp = RZN1_RTC_CTL0_SLSB_SCMP;
> +       }
> +
> +       /* Disable controller during SUBU/SCMP setup */
>         val = readl(rtc->base + RZN1_RTC_CTL0) & ~RZN1_RTC_CTL0_CE;
>         writel(val, rtc->base + RZN1_RTC_CTL0);
>         /* Wait 2-4 32k clock cycles for the disabled controller */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

