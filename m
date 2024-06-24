Return-Path: <linux-rtc+bounces-1396-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A18AC914F76
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 16:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51FEA1F21077
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 14:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183EC20330;
	Mon, 24 Jun 2024 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHGiWIT6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280841E511
	for <linux-rtc@vger.kernel.org>; Mon, 24 Jun 2024 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237694; cv=none; b=ku38BgboC9Qt4vVqO66ZjxUuFx8h62T4Z+tFDqj8kZSD22t1sqXtxU4Hk83PXwBnLNaGC0H/9eC1slJXpMajmI0wby9Teob2w+rZ+Y0PWKxPoG5cmLC6DVE02JniPsae8Q3JtnMFs8o22hrkqTVQ9U9vN3VMliMngY5wpEhBk6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237694; c=relaxed/simple;
	bh=vTMD0I/uF9P38RZWO64q+lixudVrw+D6GXCczK5PXXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esX/TgWB3pJdb6NK/KFBlZ7DX6bRg5MeFu8CKW4eFZ0S3kLe94anwQZJ1L+nAZyaMl6nCMm+P5kAFG3Fenfj2EDJPOUWIGv2hz554laJ0syXQmVh3o6lC+QM6obVnQAbH90X03NcrGaEM7lw6ggWOJlYmLwm9rjc+TSFmP9lkr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHGiWIT6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so25726085e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 24 Jun 2024 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719237690; x=1719842490; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vTMD0I/uF9P38RZWO64q+lixudVrw+D6GXCczK5PXXQ=;
        b=kHGiWIT6432/505KFQcOWQp4/7qyFuGqsh77i426AIchi7Y06x9YOrGiblkULoIlOb
         SKibjbRCEnsGFTCgKepTyL5tuPuw0TmNPqCoCsNXBOZNOyn2chKCkC7i7YyKuTjor42J
         Zpg/+FOTpFd/h6tJP7iNrQOwc0QJnubCgILIZUuVz9RaM3vIk/KyjClHAQjpRf3oEnkK
         q8k2gUu3afq8gZgNjT82NBqA2MYyYjWT3d5U9C6/MqUAXcG6u5TWQBw8R7ITmJaaPrua
         pP48rSR1PPOdb7qqAJq+UuBbAUzpo7XL8x0b/VihzrWQl1+HmTVM+I65PrWDUyghXkJD
         I/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237690; x=1719842490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vTMD0I/uF9P38RZWO64q+lixudVrw+D6GXCczK5PXXQ=;
        b=HLLBjJ1pYukpcn6V7y1+dm4S3kGcxEqnrOHwCPYewSJcCDWK2MgM/jvBG0/HvvZPG0
         bWXyCwP6CQa2Ox9Y27J9LjBa6wCexrK/VFXEbg+zvqxz5kQnSjRkur42D9o+ge70X7Ii
         trHVoL25fkawIMbZJZTigj6VUNzXZZJEYAgWsJL6Hgfik0lVtJFYrfLBi9JXiQLMgcqH
         EymTFeythDwMBreYBhG14+tmihUToM2V2spwUesnBqQRvsxLwx8GFENC1YgYeYP7yCY2
         VxCK++pGGLXvfNfyjhXyvOvYXKpV4mTeQG2yclZkMJIwAmeWZCa4O7vN6QzBbGhlFgUU
         hRAA==
X-Gm-Message-State: AOJu0Yy4tA/g2TYggAzMX2YbXmqe5dX5D3tjBBK+rZHkyb4vwe3UdQOS
	EM9UZbf6X1+1LTNoLGb6+AOta8TIq0IqrK3RpOxdHDbzA/af9Hfh
X-Google-Smtp-Source: AGHT+IHBoK7bl5JpRd2kqvTViSO0VqjGI4tPuShP/YU4qE8ypw8DlRDwXTWkjsQprVK3si78d11w2w==
X-Received: by 2002:a05:600c:4e8a:b0:424:71f7:77f2 with SMTP id 5b1f17b1804b1-42489533eacmr46657945e9.16.1719237690198;
        Mon, 24 Jun 2024 07:01:30 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910fa7sm139031195e9.29.2024.06.24.07.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:01:29 -0700 (PDT)
Date: Mon, 24 Jun 2024 16:01:28 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: csokas.bence@prolan.hu, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4] drivers: rtc: Add driver for SD2405AL.
Message-ID: <lmr2wpyqxprizxdk6jilhdhokp2spimfojtwkbbapkpkom25sr@lvoj7yifrxq3>
References: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
 <de896abc-aa93-4886-a414-ad992605ba91@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de896abc-aa93-4886-a414-ad992605ba91@prolan.hu>

Hi!

> Reviewed-by: Csókás, Bence <csokas.bence@prolan.hu>

Thank you for your help!

> BTW why did you decide to add this? Did you have problems with these high
> bits getting set?

I wasn't satisfied with the previous check. The mentioned bits must be 0
if the time is valid. I think this is a better way to check for correctness.

János

