Return-Path: <linux-rtc+bounces-5534-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0CDCBC0CF
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Dec 2025 23:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52D6B3004D08
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Dec 2025 22:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459A4314D15;
	Sun, 14 Dec 2025 22:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="POEj1WJ/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD1A2BE632
	for <linux-rtc@vger.kernel.org>; Sun, 14 Dec 2025 22:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749886; cv=none; b=PnHaVFtiyXRRzgjyJ0W6Ss6GhvUqnjnyJKd+Hmwtf0QGFj65ZuvBh7BEVpOyusTKhtDZG5oC3Z1xEkOxt3FlBJUHfRIa/2Qdx2UZuT6OtMT2sk+eaZEaKPOEJ0JqQsjxYMcD00MnGSi7IUTfXCp0awpYjBL3uebz68nHt2ECUKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749886; c=relaxed/simple;
	bh=OsZtNvC57Q0MTvQ0L0dGnqvyWUsxJxn5my2UaWA/0e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRXSIMiIMearkNZ3wWAhYHaayccQp9FHOCgi2uvVLsbbaa9EbTuK3Poh42byHfbBwV8XkJORcFMG3bFYkOFHPXABg7yDOvKm1fGEt2xGBBplSJtpyj+8RB8V3mjfNpcogtFsaA423oI8DsHl6CJtTh+hRk6wRVsGASfqZ0K1FlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=POEj1WJ/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8887f43b224so35544476d6.1
        for <linux-rtc@vger.kernel.org>; Sun, 14 Dec 2025 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1765749883; x=1766354683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/cTj72ha+a5XJMJvRmgDZDY2gaP3p8aX5U73ylQ5QC8=;
        b=POEj1WJ/MCTEcFpJB7A/t/8hB8kN4iW+jypO9pdrCDiMmXktoDW1uimdy/TlbOpWWE
         Qcj1fyl5Vl3Ba+T9Zv3ByfhWtvlA8GZGEiaR+qRXTJsFVN7Og10c6nr/4evqUM7kmRj4
         hD9CLYFB+bL5AE7UEGIQ+bkxeKAYcyDIK4lU+nMrYyiNK5OdOHsihUit1U3I9bsgfCE8
         weriQ36ITho+DB/T/2vf+ai29+0iUK8kIN8lb8qv4XJKOkKUPGmEE4U1RWFSiAWB70Bq
         zmjzEYGxHURk2Sa3eQXyPLTVuNMxb4Es7hJMJjzhgjCQn2e1PQjwEphvB29OSYF1jGSU
         EtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749883; x=1766354683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cTj72ha+a5XJMJvRmgDZDY2gaP3p8aX5U73ylQ5QC8=;
        b=ZxgIIOQomSsA8Qju3oGCjRrJdNAiTGLcz9fAioWoyUZWqxCMTT/yzEC+mG//ijQOKj
         QqhJSQSHlBQi7lgkOfJFFrDNhjJLcaCrW+bJ1aMtK8VKUx8WKVPAD+faMf3praBm8vag
         Mac8UZkLGAVIWQ7UVskR1Rfd4utZvqLVpRHg+pkBWtUz1DuNqVBmRZsBFCW7uI07rD2R
         9QC00k8/oBLTL+fSR+r4tkB2P2CRMx0twAluDZJV2rI5KOX3mLwNI4xZhPOFQENDxkAd
         An6gmS8e+7gdpZ/g6BXOhovIVtJ7wvXGIdgLxFFPqSsK1KdI+UU2hhHErFVvEfYkJZ8O
         T2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWKyooUjsLwZbfkOSn4r9z1fyLqddQ9nr4EFqATP4G6kNDp7zSF7aGBacoBF+crrCA5nVXGBrT7SWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3EF6v7kkOQMw6jVBRZgSLqq9dWNKKJG2yDgw89Yk3VfYHn/9
	Q1yeyeVaPkBgK36SVKb+m4jPtMQXGujwIQ06/WkhT3owPfeuuh2YqE3ho2Zfx54ISBFPSFHlHeR
	f1hNmmqb5UQ==
X-Gm-Gg: AY/fxX7iuaaZfyA8psMGLp/xTHOLlLOzCTldr6gDGri9NlP/34W/1aU1qrBmu71VH8d
	8cBA0vzynxes3eDZ7+dIhywZDni44JU7MJDUU6fTYgZICXSUPosTVfUT3Cqev7k12mK0dzhQ9hM
	GVCQho0Hd4/McTLUMRvQo2rxV96b9SONZJUqXUxHv3UNhPG+SFVK9Pp5IOPdWMO3/IKtoJrhHSo
	jIWy1nZOaHVu/CrBTCXXW5jjhcL43grnLF0jZ9JpRs2btjmik1EPeEHRPl5uAc/QpZ3db0Rs4g1
	Skp39qyeGyYEVQ8bvJm461MwxhLHkLRWZjNMoWa/nJkq9vZq2WgQPefhO3MQWuxd8nm/xOX2hRo
	/212HX9/AUKQZ3HvafRX+o/2aG8UIKSiS2oUWtkqI54H6WiFuPvrZwbzuoUjIVL1DKbdzXIthmU
	hU6ETaR3xu+CyDpp7gKa4mdsoJZuXUAaHqBNFmDjjU
X-Google-Smtp-Source: AGHT+IEDFcxqfAIv8Lzvd0GjECj/WpfJVYeBMCOAIQ4Nzc4ZxKDvXtd5bV1zeaqceaQ7pMz4WHhP1g==
X-Received: by 2002:ad4:5c48:0:b0:880:5cc1:692c with SMTP id 6a1803df08f44-8887e1957ccmr128935286d6.17.1765749882988;
        Sun, 14 Dec 2025 14:04:42 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-88993b597f7sm39205576d6.14.2025.12.14.14.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:04:42 -0800 (PST)
Date: Sun, 14 Dec 2025 17:04:41 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-rtc@vger.kernel.org, Esben Haabendal <esben@geanix.com>, stable@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <2t6bhs4udbu55ctbemkhlluchz2exrwown7kmu2gss6zukaxdm@ughygemahmem>
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
 <gfwdg244bcmkv7l44fknfi4osd2b23unwaos7rnlirkdy2rrrt@yovd2vewdviv>
 <48db01b1-f4e5-4687-8ffb-472981d153ed@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48db01b1-f4e5-4687-8ffb-472981d153ed@leemhuis.info>

On Mon, Dec 08, 2025 at 03:35:42PM +0100, Thorsten Leemhuis wrote:
> Lo!
> 
> On 11/26/25 04:18, Nick Bowler wrote:
> > Any thoughts?
> 
> Not really, just a vague idea (and reminder, this is not my area or
> expertise, I'm just tracking regressions):
> 
> Two fixes were proposed for the culprit, see:
> 
> https://lore.kernel.org/all/BN0PR08MB69510928028C933749F4139383D1A@BN0PR08MB6951.namprd08.prod.outlook.com/
> https://lore.kernel.org/all/BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com/

The first link is a patch for a totally different driver, as far as I
know not relevant to any system I have, but I guess that makes at least
3 different systems which have regressed...

I can't figure out how to turn the second link into a correctly-
formatted patch file, but since it is a one-line change I just manually
applied it on top of 6.19-rc1.  This appears to fix the problem.

Thanks,
  Nick

