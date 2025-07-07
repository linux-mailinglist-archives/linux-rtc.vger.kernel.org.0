Return-Path: <linux-rtc+bounces-4432-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97534AFAE53
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 10:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C378E4214D8
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 08:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D224928A3EF;
	Mon,  7 Jul 2025 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3q/n44V"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4201619F421;
	Mon,  7 Jul 2025 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876066; cv=none; b=UAWZkQEIQGs2GohrmtV2gefv48P6QFDTZ2edTtfdMP35YM9sqUjsvwFh79di2IdraqswDP6Tou/06ojaxIMJdvfDoGwyW7F29WIMD6Zo2Svemq/tuYJ9m/YYwCV30F/e1ngZais3FmygjY/Ki4zbwK+qHf0CQZsWOinV4bioj0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876066; c=relaxed/simple;
	bh=j/EfETJ5tR8iCf4VFrMtzkCu3pynSK4jYHPhvW8aK6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFNTZaMRVgeF5sz40Iz9uMsqKvE6gQOpAtl+fz6pzzbPx5htU6XeoOPC6dXK9zFok6180FrMxufwWyPUibVw6ChRrdxpOrq7H4rU83pZ8qMWNwdwRJUWMLC8LlPBrHd5gGSAViF5ZNgTygfiBpkduk+t+8io4J3DOUPIa3fASOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3q/n44V; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748d982e92cso1656543b3a.1;
        Mon, 07 Jul 2025 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751876064; x=1752480864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33n3Zmlj7DYucwJdMVh/vsniipGmm9V9S+B1rzOBIj8=;
        b=W3q/n44VkTmNjHdcSvY14PnAcWwqeNAj8e1dZHrBMe+Q1DYkZeRl6pQa1/XXoww5k9
         TYfFNSJxXU3aHNAMLYsJmwW37DSSS62Ug++CcEIt3v4p9q+o+VwtTahCVG8OoTgBFlY7
         Ra1UdwEHhxJLVV6xpUs4yxFywOJS2nK81HnjMNcW5gzVWhKkQsPIhM9x0JgeqB62FJWD
         4DJ48FGOz0VAw7rgTGjbzlmolUNedUwd5sxYq8jPZQdohVM6H0zgZSM6yqSDVAFN20ef
         0g9xECE3PeKRNMWnkrrZr03+ca2UX14Vmz6+PqNNbmnx6mmhALHyWbutvf1dOU18BGQp
         aNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876064; x=1752480864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33n3Zmlj7DYucwJdMVh/vsniipGmm9V9S+B1rzOBIj8=;
        b=RNRLoBlfWqosEBchx+9EZ8626+AZvkAIZkz7MSfkceQoHgxO37T4FoDeClaI2X7OD5
         kjdwrdzQIypPaou6MywvR2uz1FZXeCqLlBpeGQLDWAFl5cf1k50XFK4HeHdnAvRQGDhW
         y754+X3vm+qiu/5A/3ufo2iUJ1LYciqsaCwG2pJPlhifOgopB2/5QMz6Hn/yY4xxkal1
         wPrhaxRc2A90G73hx3qJZKPqFOn3SbBZhF9nG7Qq7ZoJERj9KMrvaiK7R1NZHGs8167a
         u4iAPFFQu+nkZADupwFNzEK4yGKavrODgKjVg3oueG0QOZPXLORhp4+QS1Tyq7RSmUXR
         sRrw==
X-Forwarded-Encrypted: i=1; AJvYcCUnljGawCb0JHDdq7nyCCQnCZ7RwsRgts2Skwo3Zt8/NglyXMDsu7IvC9FJscw/VmOPefR3h+foj+lY@vger.kernel.org, AJvYcCVpZinJkk9JtxozCs5DwpSghTRxk6WEt4A3uaaCDFClN7piNK6OQWGs+XzXDo1eonv5rVCBXNdMiEGO@vger.kernel.org, AJvYcCWvK3FL1+zPaP59TjI3ZPnDOlwzRY09Y2Up9nZEmhOTCYalqjXmEm2hvx3Qqb4NSsqKRZm+nUDzsiAhbLru@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTIPb9rcI/CYOCD+U93QYhAX3ypYTVmPiailZ7gPMAlHdAt+b
	275e66mbUu970ZnHJRETZImhIBKyI8GYv+ogtpZKL4qRSGXCI0xx4Csj
X-Gm-Gg: ASbGncvXdkVfZu7jxgn5vjK9L0ArExDsVZiwFpku/EtmjW4j50T3b6r49bjMqJh/sKr
	iY2XKxBS4i5b7Uz+rQtzH1pqJ2ZyMlhtIrexDd5Q6dwPNmv9g9sfWX3Odpz7Qaq7PboD/58elot
	i7iVOkepdBRi/vJTjI5MZ1xag1HK4m1SBvpCK1fNJMARakTiQk19WtvdrYGS75q7hkTxYeBY+on
	0o6cF8codLkYft9jdRX6UCt3mIPR3XaZ0WyHi9XEOZfHX5KoLzmmgSZM9cLe/5G0HyI1rz/KgGx
	8ymlMxbTNYyVLbMUqAX8sPLrqlo7AQQz+Uk6efH8ONc2yycdX2Ze3WKEI4gT2Q==
X-Google-Smtp-Source: AGHT+IH9UGGXQ6hFlHwJSIfy12AZEvjN28stIhe7taLm+EA+OjlD4ScraFo9JUkrX9JuuH+G/cgFWA==
X-Received: by 2002:a05:6a00:895:b0:748:3964:6177 with SMTP id d2e1a72fcca58-74cf6fbdb01mr11670003b3a.19.1751876064478;
        Mon, 07 Jul 2025 01:14:24 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce2b05749sm7790042b3a.0.2025.07.07.01.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:14:23 -0700 (PDT)
Date: Mon, 7 Jul 2025 16:14:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <abhpvi66rhapjo6y2c7exl3nacwgtbjihg55rrljoplocp7heq@npvlgtbrieuo>
References: <20250608224252.3902421-1-robh@kernel.org>
 <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>
 <20250617130924.GA1678432-robh@kernel.org>
 <mig7k5zyhmata6uvjwlwlompwf22qffwvma2nhjww3cmsmxnas@y2t5ukucs76q>
 <20250703-naughty-diligent-nightingale-d2fa9f@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-naughty-diligent-nightingale-d2fa9f@krzk-bin>

On Thu, Jul 03, 2025 at 09:49:37AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 18, 2025 at 07:18:32AM +0800, Inochi Amaoto wrote:
> > On Tue, Jun 17, 2025 at 08:09:24AM -0500, Rob Herring wrote:
> > > On Mon, Jun 09, 2025 at 06:49:38AM +0800, Inochi Amaoto wrote:
> > > > On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> > > > > The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> > > > > path 'soc'. However, the correct place for RTC bindings (even if it's
> > > > > also a "syscon") is the rtc directory, so move the binding there while
> > > > > fixing the $id value.
> > > > > 
> > > > > Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > ---
> > > > >  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > > similarity index 96%
> > > > > rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > > > rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > > index 5cf186c396c9..c695d2ff9fcc 100644
> > > > > --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > > > +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > > > @@ -1,7 +1,7 @@
> > > > >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > >  %YAML 1.2
> > > > >  ---
> > > > > -$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
> > > > > +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
> > > > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > >  
> > > > >  title: Real Time Clock of the Sophgo CV1800 SoC
> > > > > -- 
> > > > > 2.47.2
> > > > > 
> > > > 
> > > > As the rtc syscon has a sub function for remoteproc, is it proper to
> > > > move this binding into rtc subsystem?
> > > 
> > > Does that affect the binding (is there more to add)? Looks like an RTC 
> > > from the binding.
> > > 
> > 
> > I think at least "resets" property may be added for the this, but I am
> > not sure whether there will be more.
> 
> Just post complete bindings - see writing bindings...
> 

Ignore my guess, I have confirmed the binding is complete,
so free to move.

Regards,
Inochi

