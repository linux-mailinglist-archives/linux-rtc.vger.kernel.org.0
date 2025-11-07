Return-Path: <linux-rtc+bounces-5289-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA0C3E4C4
	for <lists+linux-rtc@lfdr.de>; Fri, 07 Nov 2025 04:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99DA63ACF75
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Nov 2025 03:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAFE285CA8;
	Fri,  7 Nov 2025 03:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="cn57xZ0o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD9227BB9
	for <linux-rtc@vger.kernel.org>; Fri,  7 Nov 2025 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762484777; cv=none; b=FAu7N6N3MhEeNSAfzMWYU2S8b/BfP9WL7ZcZtzF8anxL9fDC81jCsWu/Ft9AVWSa91YQmssprsXVUElyBd4a93e+TIfn0bhWbP7m41WLCAvcu8w6DYCc6aYlcPZM7qEqv5dJTrQZbYu707XiyGA1T6LwyUxE+OwsZEisWPy7BhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762484777; c=relaxed/simple;
	bh=SqF6cjAe5fIGfKljFwR84iVXlUipV5ARm6YRakF57pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQSL5ImdhcjrT1inkJTDXukg55qxTh0xo6QeBhewbbhDLiNjVi1pk45U2QKuIChSQbqoT5TwF1kTxGgMeEkhDYfDdHXFIYpqmha5DivicCJ4xaBKUHM/5mcUglCxJTgyXPNyc43xiAkt1kWqflHhO4FfPxoalDB0LTKKSDB7GJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=cn57xZ0o; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-880503ab181so3368966d6.2
        for <linux-rtc@vger.kernel.org>; Thu, 06 Nov 2025 19:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1762484775; x=1763089575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E56miCz2ucyW7p5RTNikjLhgl4gC4pK61qcfT2Qpt0U=;
        b=cn57xZ0oPlgAD+CBSKMswSkoX9xKQS1HixdXW5ECEdl1/YgEelftUJw1DUcEfh+duA
         CqyX7f9UdS2NaP2m4VEwp/qSKjRqSQDW17RbaRWRXGTqnivMrDDO91IRo5di4cHofFo4
         dDmQShLEs015pKEKpL5+2L1UsNOF0CCOCELwr7VtTZodwebonazUVnNh52D0rcis0esS
         z9KV+2j1vbSwr3RhKOGq0fn9HINj478kHnk0DOEWVuwsrTs0VH637mEM4F+1mdG3XZr6
         s+cYsLKU+BMUC+arbyjobnJQiPwtQZS8rT7DMBjEc8kNkXUA+YVqrxCLg6UDZ1dBhD6f
         oIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762484775; x=1763089575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E56miCz2ucyW7p5RTNikjLhgl4gC4pK61qcfT2Qpt0U=;
        b=kjf04tP4pcpCE8mi9Wu9lJfiLnzBiMS2LpESs+EC0RcW4cufpfJ+3AkKVmy4Ygc83Q
         Tdn3zC6xz3NfDlR3nZvU70x/19/tmtUiZs3CZ8Fx32cjXPGGGJmQ61NbdURM7V+0R2jj
         pRPHVL75abztlbOOdkYD8FKCppp9xr5sPsq9gofkuvWwuyg4+bAwRjXWQkwSpb+JFMom
         ujKRtp8gSzneDRwMwrKSQp3pGdqIuVAN0P2SygNJOTh+MdKhO2ZsphgJuDyZaS2ne+rB
         yxbMFc0QvxxSqsSMJ3EZj+kSqwVEbnQ2a/QB9x3vdce6WaQ7SSrwBeJOOlYANCvJ63YL
         2nXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgW1wzIwSttcG5lcuVzh8rNEp20k4F8P36NIdpBE+p+31Z7huD8sNRfmqSaB0Ldp355frBBsT8qMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZCpQ2/gljgRaLYkzsKx49RDvbihUst6wxXEZoefuF+Zafuz3N
	AquxG2fwIZmABK3ejxAsSf2fqWbqYr4Lv7ZtCkRRziYU/YnhHmM/wtmA0v+DfkQLYZU=
X-Gm-Gg: ASbGncuXYGBLGMqggBkG39SwM1BkvKdWOBBbhIDLBpaXWT/qimjiALP+XBDzC+w23Rr
	0zdFCCuj/lbc3qbQ6J0goMvugbv4QoTwBwXtwjc88hnnLbLLDcVSahg70wDi3WDaohfHbAQ5rzR
	Vi0UK24kAuaqGj2K1LsV3lHgw8MkyhcLIHvB5j/2scKUKOK13fxxueeqbKHCB9IwFEIpw7PR8E4
	H8XHCLxuLi9pDc+9BjvMbzZPKh5bzSA4DKkjKMeXqeVNCbUXs8LCEI+TgKFDKR6dCgSMOynrE1e
	RCqor2YKcXXZcWSNRF0ZwbR6Jeb0aj9S+5RBqNGosKrBCMyPC1b7gOsqiOyEpkLZsYt3uMKMle8
	glnYlgRWkspDN9ZBb3a2Am/6+0PQW7u2js2Fogpp+KJGV2TjBxzJvEyOVQHXqFOoaLY5ZjhEeCp
	ggaJmVgFTFgZt8lF4tGhTCDKzrWtjYoCPN3dxh4L+y
X-Google-Smtp-Source: AGHT+IEwrtDh+N2RU8TdlIkL8MsNx2X7a1H9tD28kPSplx5JFVcsb0223J9Fj+vOzbjZ1jDImx6R0g==
X-Received: by 2002:a05:6214:4004:b0:87c:108f:676c with SMTP id 6a1803df08f44-88167b17ed2mr26261796d6.25.1762484774711;
        Thu, 06 Nov 2025 19:06:14 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-88082a38210sm30548476d6.55.2025.11.06.19.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:06:14 -0800 (PST)
Date: Thu, 6 Nov 2025 22:06:12 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Esben Haabendal <esben@geanix.com>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, linux-rtc@vger.kernel.org, stable@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <e7ezfmqnbduq7jdc7osicqp4rnztu466gpbcxaoj54jfigsvvp@iroscsnamy3c>
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
 <DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com>
 <ni6gdeax2itvzagwbqkw6oj5xsbx6vqsidop6cbj2oqneovjib@mrwzqakbla35>
 <35bd11bf-23fa-4ce9-96fb-d10ad6cd546e@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35bd11bf-23fa-4ce9-96fb-d10ad6cd546e@leemhuis.info>

On Thu, Nov 06, 2025 at 11:25:55AM +0100, Thorsten Leemhuis wrote:
> Just wondering: was this fixed in between? Just asking, as I noticed the
> culprit was backported to various stable/longterm series recently

I am not aware of any fix.  I just retested both 6.18-rc4 and 6.17.7 and
there is no change in behaviour.

Thanks,
  Nick

