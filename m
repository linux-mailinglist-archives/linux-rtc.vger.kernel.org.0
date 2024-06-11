Return-Path: <linux-rtc+bounces-1271-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC99903252
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 08:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BAD3B20AB6
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 06:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E53A2A;
	Tue, 11 Jun 2024 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErcpQJC6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EFC3BB30
	for <linux-rtc@vger.kernel.org>; Tue, 11 Jun 2024 06:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718086661; cv=none; b=Iux1V5eaA1tfTsNa+ojd4928yMjlt7VXShaQhgrEkz5/3r4DetMTqxaKi8KekevKdVQ2SvbiXTFhiVZIFXAayi3MgUxWiuwVH8LPuPW4VknSoCJTPHl1gpeP7gb9c8JYnqMsjO9L7iX3a4QzCV9dWmTdE5ipzbGnfOyvt4iwSTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718086661; c=relaxed/simple;
	bh=kxRIXiLct8H4jgqAU0BzI+dpHrzCqkl8tjLVJ8zHbTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdQLQiAIsEyb9Nc6/MDkxzI/M+cCOd2bm6aMpkg4Jv15dtzLccHSi7zNM6c6S+chuZEo8nwVAoQPbTLMIrCM5NMHXDtqf+HclvwYfsgQNWUPcXsBQEDdV9ABDjS7kfv6bARTNx+RabkuaJgVh/JQzj8gU7CJfea1/kHUGzL3bN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErcpQJC6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c8342af5eso2316080e87.3
        for <linux-rtc@vger.kernel.org>; Mon, 10 Jun 2024 23:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718086657; x=1718691457; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Gp9c6USZVLVy6ZypOkbIZLwiQKkQ/KVmvjxobMGQiQ=;
        b=ErcpQJC6vyo9kc6PewNR5HQrpaxoD/CvqhMIMGFhlFcHsJd+jFHvln/UsG63spdXP/
         /Cj5qwzdCyHoL1b9bi5F5msKqx+qyObu0MVvCEyeE7SqrWgAXP39IYAo+bcivseQ6Crp
         otJ+ah77fPcyuWqwOYZmEsZ12pwepyoZobPdl0Lgu4pPx++IXS95/sLst3y8gQzPJRt9
         +6MFQSTawVsrdX0cFSE0KogOoqyeUkDAH31h8ef+dcTFvKwTcG2rn5NOYxDT9ysRt4UZ
         gA7XEVzN03Fa0mlJEp8U6CsYQdLmKgqXd/OHq1LtJd5CChNvcv8+un/c0mkY8vte+Yu6
         u/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718086657; x=1718691457;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Gp9c6USZVLVy6ZypOkbIZLwiQKkQ/KVmvjxobMGQiQ=;
        b=viICs9Uil6QfpgrZNbRaZjAfkV7LssSmpUZTAI1NUvJibqodyjrR/iVR+94vU2T8pU
         PLeptgfM4Vj1PBN18IFVgwuUQmbiFKjIO94/XkEzHrz+NRjTCYWBpzVwmu0WFQJWGyrc
         +FcZwcycYj7Z8WVGqvzdApe9KWyJ4ypv+eVPvhqkxvI/gCQRHsIxJc32kxyy//t35v+g
         I8UMq5vOJ/uAC2aZH2QXduQmVPeo7TdRuj0YOTaM2oncGjWTOuhrLuoNDuHZLEdz/yBU
         x373WO2wbUYZJLEhOZY7XPr/+pRhawXldgMVxi4qTYNpTK3kg6QvBUhAI1pJSEiXkqG0
         IUlw==
X-Gm-Message-State: AOJu0YxGxtEH/E7XytlJCPQpX9iIcaFOSWUOG4uoTJRWj+ovL8Gki29b
	33kK153XyzwrQz2+Nh6ahTUPq3DW9uUZkJG/95ZlRWAZu25j/5NyeyjTSPNz
X-Google-Smtp-Source: AGHT+IEIEiPOkyj32mhIVGdBzwn4fN7kblQn2wm7HiQNN7INk/NL+GJo/xS+sB2ek1y3LHSkNB4iZA==
X-Received: by 2002:a19:5f59:0:b0:52c:818a:28f0 with SMTP id 2adb3069b0e04-52c818a2a98mr4038421e87.6.1718086657071;
        Mon, 10 Jun 2024 23:17:37 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f29116506sm2797253f8f.60.2024.06.10.23.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 23:17:36 -0700 (PDT)
Date: Tue, 11 Jun 2024 08:17:35 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: csokas.bence@prolan.hu
Subject: Re: [PATCH] drivers: rtc: Add driver for SD2405AL.
Message-ID: <3uut5thlgeyfalsxcmshvzrcvkmcxe7i4owfzcbpzj6mdbufhi@khnkoogxn6vz>
Reply-To: linux-rtc@vger.kernel.org
References: <20240607-rtc-sd2405al-v1-1-535971e7a866 () gmail ! com>
 <2df081c1-8962-47c6-adb8-f3a6d18fa624@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2df081c1-8962-47c6-adb8-f3a6d18fa624@prolan.hu>

Dear Bence,

thank you for your review!

> Is there a reason why this can't be a ds1307 variant? 

I think it is different enough to get its own driver.

> If you really need the separate driver, then you can take a feather out of
> rtc-ds1307's hat and use `dev_set_drvdata()` instead of
> `i2c_set_clientdata()`, `dev_err()` instead of `printk()`, use the `BIT()`
> macro etc.

Okay, I'll refactor the driver to use those.

> * Even though you defined alarm registers, you're not implementing alarm
> capabilities. This should not be hard, given the datasheet and the drivers
> of similar RTCs.

I'll try to add this feature.

> no need to #define all alarm
> registers, the alarm base+offset should suffice.

I like to copy the datasheet as is.

> * Also, you're not doing anything with the control & status registers. At
> the least, in `read_time()` you should check that the RTC is running by
> checking CTR1.RTCF, and if it's 0, return -EINVAL. Similarly, in
> `set_time()` you're not checking if the RTC is writable.

You are absoultelly right, I've missed those registers.

János

