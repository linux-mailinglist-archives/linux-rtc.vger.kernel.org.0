Return-Path: <linux-rtc+bounces-3506-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B95A632B5
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 23:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C068617288D
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 22:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85201A5B9C;
	Sat, 15 Mar 2025 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzU9zQfg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9991863E;
	Sat, 15 Mar 2025 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078508; cv=none; b=d2nj1ebxJkMjSS1+8IlyUUtsHBgKPZFiUWq2H6umyRFZGWh0xZlOZjYJPhHfcRqN9p3iSSUwCv5wahYNQp7DSiiqhBSnYcSeEQ2NX/LcGdxbaGuu4xYdhZRMNzeISUK05wGz18OXFWg8xXOM8cwpiANS6dfj+I/czR571RcvT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078508; c=relaxed/simple;
	bh=Jf571fJFmte/DhZSthgmF2b40O1xMlotcPyEIOLl2JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L87bHdTiAgtZkBwLR2AGIhjhhfRaXlbjprAaQhIENvSaVuItbOOMyckFEL2z+q++iT6vgE4bwIstN9OOV7J5+SFOgSZ3ERxjXQA7xqijk6PjbbKKk/+ZMo7qKsFs+EK/w35+p9kUW4r48HfqgCtzOezFJdqGo2t/sQmOijYZLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzU9zQfg; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47677b77725so33266591cf.3;
        Sat, 15 Mar 2025 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078506; x=1742683306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3oY+38sr/sTYloBDx1wzQcavdV7QLVIJiTk4O6N85+c=;
        b=XzU9zQfgF9sfgvk6oQwpYy0uJ5kgV7FcXjHLFJkocQoV4yMc9RXMwmEme0475PrKsk
         oa0xsJAZqqlz0AcGOKxln2ywRzbG9o1twXFr2n3bT6E+RrgnTt5Uu3DWjoDJMU2q7VV5
         f7aGj8rXAZzjB1bIz8hMrVFB+98nqujOFNlmcGqQZRc14u1KBN+nWtfNBjfi6yMJJ6el
         veEDZXD4hJWUCAoABWzgsJpsXZPhQAN/imD/itVfMaax1025wshNq+ZlhjaUj/ZZGlmp
         Jgp8ZR2knDAlS+moAsVX6xvup/6ZEyRtukI5inA7f+WbsQqAJYP8hTKq60kN4zJc1nEc
         rBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078506; x=1742683306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oY+38sr/sTYloBDx1wzQcavdV7QLVIJiTk4O6N85+c=;
        b=qAxFSGJigOziAXAB5sHlCQhyBPv6UutsUnxTfv004Jsw8dww695RMozsGRcqFoV6GO
         VUk1focbWUASEPBZHZYuN6YfkpgTd845Jly5hw7/3Cq9JJPleBbTsKgbfGRsRxniTkwF
         zjMO4Cu0bMm3e0HD4z0CqIWLfypSWahGbjYWAV9GTJHhg58nI45zDHD3Xzu19ZKFTHFl
         0jo6ImV3ug/ykmviOqOtD81PGhmzAVq8/PM/V49CNA6s1UK07izHDlb9iaEHqCdGj0T2
         2BaPb/tUr+c5w3hjkJKZzFQffTx3K3+v0wYLgMv5xirRn+x9/zABkoazKOfOr/7RSVun
         j9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUqOKvb0iXZqCZZmflIGZRQzzhi2CVNIQ7rFQYzSzeWTIBLTqvfKzHa/7wldzC1FPvbToq9+sL3aBzf@vger.kernel.org, AJvYcCVKkL9HehqPGBhtPvAHNRnVvTZCja8T/02lqzh7uQJoqAdeol7NfQF19b4oAdeeD15dcuzKSkxZmlFc@vger.kernel.org
X-Gm-Message-State: AOJu0YxJuQiGaNAm5CAy3W7aXXhZIqdDnRir8srDQ7+7SbpQIA2OGQyj
	OwvOhu7plZsCBiVfZWdzMYwTrH0/6T1Kuj5yEi3CQ/VY8JDY/Wof
X-Gm-Gg: ASbGncuPJk28islpzbpBxRGgPRzKNSYCSTCWd4GUffmXvOnWY8WvfOyZbj9yhKI14An
	JHGmtEXMnOG/b5xoCg93tnN1yCrjbLrP9x+kORzp6W2Y0ZDW9McLVlMBs8WGfqzEab84BrNKwxC
	hAP+yo0tLp0eOdgLTnEW0i1CO7N/yw//oJCfX/Sju4eK1X7GAfN73i+P4b8XBnuGoh3Z2gsRepa
	F6CSC3QBpH42QwxW/b1gId25j4xX0oWhsKbV/2LxNJuwpj6cItlyyumfFXgZjUnfprzPhNXmEZF
	H8q8XlY8TZqlrp9PPjbM
X-Google-Smtp-Source: AGHT+IGOFiRVhdZ/eu0TanCLon0McdNf078cGTf/0sdx3EdLrOVY3VTRn/83W7DGE+QGDjUd1bR0sQ==
X-Received: by 2002:ac8:5d91:0:b0:476:980c:109f with SMTP id d75a77b69052e-476c814a250mr128589231cf.19.1742078505965;
        Sat, 15 Mar 2025 15:41:45 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb60aac8sm38208641cf.15.2025.03.15.15.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:41:45 -0700 (PDT)
Date: Sun, 16 Mar 2025 06:41:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <5txsmekwqy6a64fafatnttbu2kj7ztrdbhptzw4cp42rht6kjn@wqcr3ljmyv57>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
 <99b7f8181abda40c78bab67cb5a4b00b62851b14.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99b7f8181abda40c78bab67cb5a4b00b62851b14.camel@gmail.com>

On Sat, Mar 15, 2025 at 04:55:57PM +0100, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Fri, 2025-03-14 at 08:51 +0800, Inochi Amaoto wrote:
> > On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> > > Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> > > comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> > > machine to control chip power-on, power-off and reset. Furthermore, the
> > > 8051 subsystem is located within RTCSYS including associated SRAM block.
> > > 
> > > This patch only populates RTC sub-device.
> > > 
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> ...
> 
> > > +++ b/drivers/soc/sophgo/Kconfig
> > > @@ -0,0 +1,24 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Sophgo/Cvitek SoC drivers
> > > +#
> > > +
> > > +if ARCH_SOPHGO || COMPILE_TEST
> > 
> > > +menu "Sophgo/Cvitek SoC drivers"
> > 
> > No Cvitek, only left Sophgo here.
> > 
> > > +
> > > +config SOPHGO_CV1800_RTCSYS
> > > +	tristate "Sophgo CV1800 RTC MFD"
> > 
> > > +	default y if COMPILE_TEST
> > 
> > I do not think it is necessary.
> 
> Maybe it should have been
> 
> tristate "Sophgo CV1800 RTC MFD" if COMPILE_TEST
> 
> like others do?
> 

No, you needn't. The first line "if ARCH_SOPHGO || COMPILE_TEST"
already does the expected things. This is equal to remove this 
"if" and add a line "depends on ARCH_SOPHGO || COMPILE_TEST" to
this entry. Just remove the default line, and everything is OK.

Regards,
Inochi

