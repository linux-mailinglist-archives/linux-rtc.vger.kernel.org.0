Return-Path: <linux-rtc+bounces-4726-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF849B2C424
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 14:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 815DB521607
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 12:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592CB33CE94;
	Tue, 19 Aug 2025 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBJsEIAD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C01F8733;
	Tue, 19 Aug 2025 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607803; cv=none; b=UZMhko2hkOuDNc3iVlcZNgV+EBuqZhskrRiaFhe0w10DFLiHGzIs7uaHHbAtwK3dtVI2g3UeoGVzfdkT4XZOp0HNUtbE5079l1QkvW5NnzrbmZnFUybl5rQNBdSRBwevmy4O2woD6bmbjoPzVXd81uBoolpNdhZLe2xY+gCf4WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607803; c=relaxed/simple;
	bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggdRQ/V3SjHD0CDxTzzoM1aYHOv9QQwo+gVIjy/hEz68LdbsznBhFqw+biiOXcmFt+bRlP0gVEZ20Ti96XiTSyYHqOq9zgqef7jAybTGJdSBIioNnDNH+Kr3W1LEhpc3uDS6lqSBd+wSkSpR13JC40Sz1RsX6BPApQyulgh6G7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBJsEIAD; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e94e6c6150eso620416276.3;
        Tue, 19 Aug 2025 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755607801; x=1756212601; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=;
        b=WBJsEIAD9yRodDszJlcdhM/59iiyH4LzOgFnYhuWdI1o0q1HLKL6cAXe/xM0301cHM
         8TBTnHD1U0lIkYeK/jjVhMI/hWUZuKJabcWuYoPv5taQdV400ZEEjS1DnZIxed3yoqGX
         CP+uD2y/Q3bzX7T1jOWDI7kK3eDwvO7VJEdNLD20wCgx4zUIqVNWYjYLzPNzERAneSQd
         uEu9Cgm5jVZ3MBF0woGIoqtynhexLd7nSQ5kJGZ6LuT1HMwt2pdU/94OfdAZJSZAsyES
         L/HypitYgnhUPvrJYo9prxd2cbPfSzrLzXorzsbYhmDlvZGbSGLPVUvr+PSv2xQzuZD8
         Wpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607801; x=1756212601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=;
        b=b0Akjp4qI3kNUHSQO6MCN55S+5zW035PvoNBfynI9F4bCTULvM3zd6JW3zqE84jABe
         mD11F8qZzvuFOfWRA1UWpm5tPvi9asbkdXqGzdRLlqvQuEQwWcwzyusxQFhvMrpc+Dno
         z7ymRZUv7SKtiPqrclXfFIASOgzqZ6Bebki7W2NXLKtrs8vPhVMC/sfHJhH5n4wCrqmY
         iLb/Bi3kTEU+3VH6gLRaC0PGYg0IYs4suxRh88npWyztzdX3MRy88GofPcrUdEj0vDV7
         tJmZF6H15JNWQATnyus3WEUVWPh3JZf3fV1jBrK1wMo6ekAJtxFGjaVmfEluZO0JTpDf
         Hzig==
X-Forwarded-Encrypted: i=1; AJvYcCVoloKl/qlzeSJ0I3PcXpSQKHKaTPeCnAyCzuno0e0VMxOsn5FgZUHHa0qRbkd9cAO8K9EM6eqeqYMxczg=@vger.kernel.org, AJvYcCVt9mLu9pjP7w8lAuFmr58I9cZT/nqqumYo4jCcgvd1zbyRI2o4cdsgin9TXkZC8fc2FZfGl7Ums/aa@vger.kernel.org, AJvYcCWQAeroAhRh0OxccUQjB6GKJjcXqxJf0qddvAnVXDPNpyWq9wWYyvXa6EO5pJF8JTcJrlp0oANP9/K+@vger.kernel.org, AJvYcCWp1dlZYbLrLPYBZhLh43dAtpjanF/qZqYA8+uB54FnU2dgFnPxIvnx+YpeuT0iY788L3tZue25azivnbA=@vger.kernel.org, AJvYcCX45fHf9PnizP4OQk2g0rLd47tW6wmEuJWrPRKwvWhgHI/AU3Q1tdwSF0p1FQKS3i541z1hScr9aRmzDEN3@vger.kernel.org
X-Gm-Message-State: AOJu0YyicxONKiaGuWEI3pww3bNpLRXjXaMMzB+rjcdISOv0rZQI0YSi
	MpH7YgGPCyPjlyfyGZYqvWI6OMwbKEYVeJgz7AzDW8dbn5jmoYAkxWF5w4plGzFEMlc5by7g4DR
	EZnuAng+CS7WXN7daOrgJ/uj97kz8YR4=
X-Gm-Gg: ASbGncsleuBEy044MOhlXXAWEsrr5Gj1uzZqEUFcMYoIhKXjMSeieUnxgknZyD85eSY
	tB8plZCJUyS+CK6qfFgc6qH9Frt5VFz/x9yenL8cFTPz5NBjbYY/15IHP3GEhl0qk9p6YkDdEwY
	LOwcK2ctAcA3g3DhrDUgIKuwlrmoHsPUb9N31FVsSO5qt897Pimq6PvZf0B8Lvq93jlf0qm+DcV
	dSi96WJRhdInBSfcV2UOs3PyxmPOg==
X-Google-Smtp-Source: AGHT+IH1h+BxKBN05pHvmSdWJ4xJ7m/5SogwxucTQGgwiqZY0kchIq341vqJ9PFqt91EW03TMyusPsdeBGu0IIfihnA=
X-Received: by 2002:a05:6902:330e:b0:e93:2cea:b3f6 with SMTP id
 3f1490d57ef6-e94e630dad3mr2829156276.43.1755607800721; Tue, 19 Aug 2025
 05:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com> <20250819123505.GC7508@google.com>
In-Reply-To: <20250819123505.GC7508@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 19 Aug 2025 14:49:49 +0200
X-Gm-Features: Ac12FXzpOXpP5YWbSOcVjUpbhP2SuxCAjsf5aVyKzjKV0kcqir3rI2XCSKPBx60
Message-ID: <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple Mac
 SMC buttons/lid
To: Lee Jones <lee@kernel.org>
Cc: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Aug 2025 at 14:39, Lee Jones <lee@kernel.org> wrote:
> Separate patch please.
>

Per the discussion in the thread linked from the cover letter, the dt
maintainers have requested the bindings for all subdevices to be added
together. Do you want a separate series with just the dt bindings and dts
changes and the actual drivers in separate series or how do you prefer it?

