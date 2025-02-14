Return-Path: <linux-rtc+bounces-3210-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3701DA368B1
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 23:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE8DB3A8AF3
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 22:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0FC1FC7F8;
	Fri, 14 Feb 2025 22:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty/nb6T+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D4A1519B5;
	Fri, 14 Feb 2025 22:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739573210; cv=none; b=WsoyIFFADfKmRbuaIibssYWiBGfy0ms+AyrHnW9Hnn5Apia/xY7P8AoGz2cKZ3Pr12Eusz0/fz8w11htl8Kl9PEGW5SN+LBR8qITE7gJpo7I9Dg8JUqsY6n9SjElYTw7O0SldYbgDuBVvC9pDGHckTE1Gb3Dpo8qB6b7mys7Fs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739573210; c=relaxed/simple;
	bh=vjcT0Vyex3C2dC9HqHDwhlorjag/egfPVMpz7+hJdc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAu04NK75DbIWfqt28pEPZP7Dhz1GVO6/BMiGTHiH7AMMyIlPVn7njv96raKAhnGMV3y5wlfCXPEXfvyN+Vbc9F5U6UzTqlee0Rwc0nAVmr5+OrLJvkr+JFjtRS4zV3efSQh9Q8Mpt/LhKn1HS78y4wEdVqE6jTb/db3Kastbiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty/nb6T+; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso22759146d6.0;
        Fri, 14 Feb 2025 14:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739573208; x=1740178008; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QzS8d5DDLmgZezqT2Ij0pTgVW3KTLdNDnJ7HtnIABGs=;
        b=Ty/nb6T+RKfp37W5YIGwEosREjp+C9ERCEF7njjffyV5iJAAO5yaRXI7+Ebd/V9ImT
         +PxE4mAQV5ho8KokYjStonxbaxV9F6iY3DfdcAUMvL81OuGKFVk+OkWI0GEvxUfa1P6l
         3o87NvTvGyE14535OP1UfRkQ/U8z38LIKqmTuuvz2wJQl+hRHCeWil/NQ+tySyoxZcyQ
         lcM8eeGXhcE+Au+XxB5a72IZOGk1eRhLBL3yOvp1gY5vQNrgiPAavcfgIslOEnof3p6y
         vDVKszwMxF7TT2e8TPgJpQ3gJSY+oSXd6mpztRydumZpgAlGhgESYL8NgWvsfPY7xuGl
         Uu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739573208; x=1740178008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzS8d5DDLmgZezqT2Ij0pTgVW3KTLdNDnJ7HtnIABGs=;
        b=CSfPZ28tGnme87j3nH9DUNa2+w6l6g537g8fqdlxEugp0wy4cfyXjEutS/h1hDjS+3
         s588SwsUQoYtr7GngMMCWn8U+PuiPCFuaQhulB24HqDx6qgfy3t26UFNA/qszYzGUKDd
         veuRb5wFCZZ7VgGDM6hiGf1Aa8F2CzX4EvgC/EB3niJdmYKf5bvKMnSdQGByuzgIZaZH
         dCgs7cIhuaeOPtb/YUv8w0+Sahu2oCGzsO1/UtXYlPzCKNj94w9wIpKb7Ra4EoPBTf2J
         LZyvLQbBD517afMJfU7yDLQWz5Cdm55SDzCIr7JeREPiu5GA2qRRgkl2N0BrKH9fL6J+
         PAJA==
X-Forwarded-Encrypted: i=1; AJvYcCUlAjdwmITLYB6E8/lZ1fsTIrkZvO/5G3aWAOb9Ly4u5gtyAoiYhI7jMjKvXkV400Ya9y24DxvPTg0tjKka@vger.kernel.org, AJvYcCUzb73dd7ttDuKKStjAmzl8rsbLQZzO1Zb5Ck+Zp6GO3w9z0jDCOKYIZQTs2xN97deyU8gV4eRXbWkU@vger.kernel.org, AJvYcCWz43Up6zk0QS8lkKK0BOYQatEXQX+RWguMweO5OkgidDT9CNFJ4hG1e39q+jP862dfQoqSSIFCMUbw@vger.kernel.org
X-Gm-Message-State: AOJu0YwQduBxqIMQysDFCwgQzsQQ2qyY0RafetTtLkmwI2Q73aPM33GO
	o0Esp4hggqaiBhgKdCAnzIx+xqBF7Ixrz1vnXCRJa13Tnw8HHwET
X-Gm-Gg: ASbGncufpZ7oBh6nGLzVHWLOjyGtX0Yjho36aGLoKyCX03phd7eI/8TO9Yz9MPouwVH
	5kVMt5PrUIaOcOdL/SBgl1HDS8hc3UhVZ8PudMi74OmCQGc7mrg0G3DEsCpdHgIAj0KzHxM+6HY
	XCYl0UxBEOdBqluPpA/9NBY/OxOSY++HE+6JBxoIrREufLwGDybed186JrFFybnPZ/C0E3evJ+I
	apleR6uQDsHHp9gUJFin2etxdElFItzJOJEmDnxq70bMnGl8NtTb7f2PTXGmYR7oHs=
X-Google-Smtp-Source: AGHT+IHrfxO8rmBQBLUcjsYSsdpJHDyVL3wH/IflhNcUGb5EOUcTe+mYC/NamiViqeorO+aQjcRI5A==
X-Received: by 2002:a05:6214:300e:b0:6e6:6bd8:3a82 with SMTP id 6a1803df08f44-6e66cd10d91mr13805796d6.42.1739573207607;
        Fri, 14 Feb 2025 14:46:47 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d785c1fsm25862706d6.35.2025.02.14.14.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 14:46:46 -0800 (PST)
Date: Sat, 15 Feb 2025 06:46:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, dlan@gentoo.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
Message-ID: <s3fsc6cp2a7qx5qgo6akneh7l3a5aknzmtzpsq7lvdaleqaupa@6sqgfn4q7olq>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
 <t6z6rikut2him5m57b6xubbguw3llczp4i6d5frcpuhlqihf2d@booethzadxsq>
 <964a016b944b459a9a914abac539350769323259.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <964a016b944b459a9a914abac539350769323259.camel@gmail.com>

On Fri, Feb 14, 2025 at 12:09:37PM +0100, Alexander Sverdlin wrote:
> Hi Inochi,
> 
> On Fri, 2025-02-14 at 17:40 +0800, Inochi Amaoto wrote:
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    rtc@5025000 {
> > > +        compatible = "sophgo,cv1800-rtc";
> > > +        reg = <0x5025000 0x2000>;
> > > +        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> > > +        clocks = <&osc>;
> > > +    };
> > > -- 
> > 
> > Just for curiosity, Do you leave a way to implement the
> > 8051 subsys, since its registers are in rtc. (You can
> > check the chapter "8051 subsystem" of the SG2002, which
> > can be found at https://github.com/sophgo/sophgo-doc).
> 
> well, I suppose, you know the answer, according to how this has been modelled
> within this series, all the functionality could only be added on top of RTC
> driver. 

I don't think it is a good idea to add everything in the RTC driver.
I prefer to separate them to sub devices if possible, so we can
make full use of all the framework provided.

> Do you think it's time to re-design it as compatible = "syscon", "simple-mfd"
> with children nodes for RTC and reboot?
> 

Yes, but you should submit the 8051 and reboot device early, and
change your binding with the right compatible. It is not allowd to
change compatible after the binding is determined.

Regards,
Inochi

