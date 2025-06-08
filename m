Return-Path: <linux-rtc+bounces-4241-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC5AD1554
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Jun 2025 00:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1165F167259
	for <lists+linux-rtc@lfdr.de>; Sun,  8 Jun 2025 22:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2EC20A5DD;
	Sun,  8 Jun 2025 22:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7VrBG3E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA31CEACB;
	Sun,  8 Jun 2025 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749423047; cv=none; b=e08iFFZOr5vPCNFFhcU17nwgYNvxkuXme7LNumhF7cs2n2ZNax/9RTU0/7hrIbhFlWRJcuiaqc+CGSfalks2H4oX2fG4oxdYeiof11Quio5DDQn76xL6Csf3sOtskk6E5DHZTR9ziarPW9IOWO5Nq1NEMVMLs9fB1ciQHj5OqNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749423047; c=relaxed/simple;
	bh=WA48rYTHajKvL/v+o1GDONAug3SMZ9Szm2cVeOrNvzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilenp/HZV9d9yK7cBwM8lkdpgeJF5nOKBWhiikDYBTbn9jd4Ir2lbn5GE3I0//hRRhRuwaKZWjke0SZ2y80G22FsHFu22gqGvYnY/2ept81VwSxc9ysyIZLBYFbxOjRp2dI2RO6pbG2xfQaon613aZPLH/M/lo10N9PKtJu+Erw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7VrBG3E; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fa980d05a8so37206036d6.2;
        Sun, 08 Jun 2025 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749423043; x=1750027843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EqDgz0NCcZN9QC0253LFQnVVu6/oAnqnobzuB0mHNx0=;
        b=M7VrBG3EieOb025KPIBBtz7mQToA2ZlEa5y6ii04QiCPmGVegth0lbxzoSVs2qKKz6
         N40b7eOqjgSZwF0XA0YVFvkWBuhrwz1MsgAsv45jAyIgX3hFB9M9EHLPeqapVP0s/uXO
         WfD4IeLpfULc10miSYYTSSDJ3SdeF0EH9pRDIzAVX8JKiq6i0WeGOY/+7JPj4heI/3+j
         W/LMWbErLdwti7Apk6YXH26et4orY6FNiLRZl8fCNPMgxUZJyHacV5otlLvbrYPPxjcZ
         Lxm/TopCvzmg0ORavIlQiOlgzkIMkspV1lD/kzgudyVLSqnQag732l5cnXVluYwcE/M1
         w66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749423043; x=1750027843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqDgz0NCcZN9QC0253LFQnVVu6/oAnqnobzuB0mHNx0=;
        b=mBVGnh6jGts44WxBIxuK8z4b8lp9ntDLWreB2W5B7PBQtF3C+i/HSTA9VN+Bz4/6gx
         kyl4HLyFlngDXFtUWl5qnPpBrxihq9S1hLtVUyJCQfORWfRfXvsQspx4rSZfjCLnX4WG
         2ZJ7Z+oQl6uOdh9J1kcIPNpp7JVR9EwVZVyunflAgdHFWWnF6JTYmhEdFxzi+A/tYWBN
         rwpUa93RAPbh9U4qpiWP6GVz3ryQD0PocRoQCF96Iw5UnABuxbZW44uFRaNFkVbLVSV4
         BTkMKQIUC5lqY5VLzAfNiYckHWaA3ezWT4+q8ao2KzKYqVFfDIt10bGhBdJ5yvMvKUEH
         YBbg==
X-Forwarded-Encrypted: i=1; AJvYcCUWPkQ2FA4FBQ3bc3Ipc2CNeeIWrvSOciSqyXwt6+n6VUoFNCUdKCCl7biXr0ociFtkTmAjvdIC0xGq@vger.kernel.org, AJvYcCX86QED8tYNuIGJ0Z8s8wAEe297vNCu3UvE96LoLuPybQylvIdEhycpKBZjSNUj0RaTxaJtqo8YV5Bl12r/@vger.kernel.org, AJvYcCXeBL4fFmD0jF+DKgjorqNjM6Qt505jnNmA/BpvkvGQb2AUEPU98dwDxnC6UVl++BNcxQHvETbVm64/@vger.kernel.org
X-Gm-Message-State: AOJu0YxBNKkPH0UiQ+vMM3YVMdkMTq6Ao7apCpO+Gh7NvqTs/s2a5r2S
	aDjVnCeK4VFIJoTOmlL2FeWpH0EwfiWDBrInNH0yEwG0cEhsB+Sw1e3I
X-Gm-Gg: ASbGncuXeIXO49iWvS/q3nynhM07C+xR1Qevu4QKRQuvs7d/RoAxaban2fWziT0D4ZX
	az/wmVZ3XUsMTjCph45qq3ZHREMQJgG6gCAD2aJnGbB7dSFsnsc9zLqeawcE34Y3nvnyu4HaoFP
	rg8+Sf7kzDxcFEae1o1fsGkzQpEQBwuGVETfpyHHLTA+UCJWoH2bqvFMcX43q5MRb+cewajKAf6
	JPd+iV9Hh8QfRSfdQa4xtWlDtI3x+kcoetDTk/nc423uoa3n/HENqfTGVBpNVU/0Px7u2LeBOzM
	G/9otZb1+Ra3N3SgMdBjeDrG+nctJew5aTxmtQ==
X-Google-Smtp-Source: AGHT+IGShP7EvG1pOezpXTDRng7WHyQP/iIeqU3gPsNBUfzfAa+p9z332xR/0u2mhjLf3j/kbENbew==
X-Received: by 2002:a05:6214:f0d:b0:6e6:6c7f:1116 with SMTP id 6a1803df08f44-6fb08f82f25mr160146206d6.24.1749423043070;
        Sun, 08 Jun 2025 15:50:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09a0e8d7sm43952456d6.0.2025.06.08.15.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 15:50:42 -0700 (PDT)
Date: Mon, 9 Jun 2025 06:49:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>
References: <20250608224252.3902421-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608224252.3902421-1-robh@kernel.org>

On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> path 'soc'. However, the correct place for RTC bindings (even if it's
> also a "syscon") is the rtc directory, so move the binding there while
> fixing the $id value.
> 
> Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
> 
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> similarity index 96%
> rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> index 5cf186c396c9..c695d2ff9fcc 100644
> --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
> +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Real Time Clock of the Sophgo CV1800 SoC
> -- 
> 2.47.2
> 

As the rtc syscon has a sub function for remoteproc, is it proper to
move this binding into rtc subsystem?

Regards,
Inochi

