Return-Path: <linux-rtc+bounces-5576-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BCCCC3E40
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Dec 2025 16:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67052308716E
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Dec 2025 15:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2182EA158;
	Tue, 16 Dec 2025 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="e8Vume33"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66FB33064C
	for <linux-rtc@vger.kernel.org>; Tue, 16 Dec 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897756; cv=none; b=reJF2Orx2sw5zDOoNa6fgyZYp1Ogi8ng548zmqTZMM98PHaltMXtrwXhsb4iTo5ml7/4nGwmZ+IsNMc4ao5gcJnMy4zfQeBaFCIZdlB40j0qwtznRhtrC9V6AIEm7A0PtscFUxyABwBJJ1nIwhHFs5IHzFAadTWly954NSo9LcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897756; c=relaxed/simple;
	bh=P5EatezNq4BgJDiRy+qSnDLhBpsRdk6obTP3oqH4CHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHvmCxpnFjz0inFEU74YEwrSE3wq+UosGs1EfJF1tdXWX2+/++gz9tW1jpHOjALPyP/Ojx2KOzAvyKIgSWj6jhJamyJwYLyWsrZpw4R/I1laX35bjEaa5ZI+5kfYXlbzAs4E72Rk4RIiQWT941ExwUN7PHLX0IL1x0SHTinxBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=e8Vume33; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ed861eb98cso52203651cf.3
        for <linux-rtc@vger.kernel.org>; Tue, 16 Dec 2025 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1765897753; x=1766502553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrMcbVCU0QysEyyCI8MUU0ym/IVFglQ8rabaf9/So5I=;
        b=e8Vume33nTLd9jJNIbvkm+gDOVCCE1hl6Gc7/107gHG+g1B8qBsz/1QWaEFsHRZn9I
         koJySIkfMuzNj+kxUziaRdfNtUAnj/a4O/m0s1TjUPKpmmBbFsX626/nGa+p1Stzm3ci
         eAUtDpklc0fPq/WpBxwcacHldW/jy5jWYjRWwnwoTVrEmd5h+DlfYXbKB5wbhGW6WFd8
         21MRUf7q5vI1FsDh/ecLO761QY4JE6sSfzYk0Jj+ZhQXKCQQkWhRFsS+herhRSer33Gm
         1CgacyDm004rYoVE6vHGPBMaPLVxQqT+Uo1balFc2YSn0mP5wDjQLjVHg9+AHBMUpcBz
         Cv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765897753; x=1766502553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrMcbVCU0QysEyyCI8MUU0ym/IVFglQ8rabaf9/So5I=;
        b=YZZFNH5641yAMQ1oTIemUKXbhHgBtnrG6IhhrwJwFBk/UtWcXmEfH1XcGcYYhiQbfl
         dyIua5zrrtTRIYj2i/XxA9as3GDSUu9pMs8edw4zXfkfH0/g6dMF1QayP2cmQHakii/I
         2zh5MesDDDrcavOMPSZQ9s6UyKPdsUZhtE74zEgFEER5529EMpTgwuNZRHu0+CQwjFLm
         kgnxsfC7+nauJgtzn/I0rW59+29PsJUhLiiatLXs2AbXh8qLGZMiH2qzo0ewo6g8Gtis
         cmY7tLHSk+G9a9ArW4RPcBtHxt9l/+SxRet+jX65Oix0mgGuVoW+TNI1cY2kubfoitqK
         TfHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiYeqEZbbQ/T5/UkP3gFECiJLFaszzbE6xB4pF1qQRYuvivtyHJniMiyjd30mE15dahiT5X3F0ZEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWG3vaskYG2sO32GAn3Q+2sczPrtTz4kKBEVBuzK8DOLNA0QOP
	oX4jVFiJE/FrFG8ovI0E0N6uF313WD0WOZ2TX5EmCcQzGRhM4MueEvRhDykmX19h5bE=
X-Gm-Gg: AY/fxX6KKCxR0EWMuTbo+YCjiVFKYDBKEVccWuVsPT098lyDD2Q+5Sj5AXo2XaBkJ4P
	B9BEcf6IUghLN3z2924NNG7H8k/NUiHVU6aB/JaTnWb3pH7542Sp5BkBrcfe0NT7uhRO/FemkRi
	QCkH6M50QZ9LMmXK1UFE5Ww0hk7tyCIvIZg3vfqgyunv4L8zS11Thi/Zd3bth4GIOKhyZcsKkYp
	ReiY8AE+F8Xm0yl8I2Qa+zvMbqqLLoa3fLAwOY4cyXZxg13qpDV73q1ZqY7CtndDRi3duRGNLiz
	0MzpUBjFLPjQJQE8uAOFKFIshepo3abLdu0C6Vfu2HbVv7ndFBwC3plqNE2n1UR5LabesmBeXD7
	5IIaWBPCKEHI6Dy/AJuG0htx15VsnMke6Hn2ar9ftSRh1NdnOC5UtseAb9Co5634T+S1mg7B5Mp
	5JUZf//xKb36Uy5Z5IYYNJLqoUI5+H5/+5H2SMLwVy
X-Google-Smtp-Source: AGHT+IEW3ea/jO7lBPSQ+CsTkd0hRgRRgaNgvTaIJoUUggk99zhFWx2fuRHPwk2sKowsnvyuNmOmPA==
X-Received: by 2002:a05:622a:581b:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4f1d062a6bfmr207842641cf.73.1765897753249;
        Tue, 16 Dec 2025 07:09:13 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4f345c2e0f7sm15891281cf.21.2025.12.16.07.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:09:12 -0800 (PST)
Date: Tue, 16 Dec 2025 10:09:11 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>, 
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	Esben Haabendal <esben@geanix.com>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
Message-ID: <g3phtogna3a55vzah6olpxekdcmi322q5lzzwxwq5za4oi4plr@js34hr72bemi>
References: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
 <80e7450d-d842-49ca-8219-a995c8ce8bfe@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80e7450d-d842-49ca-8219-a995c8ce8bfe@leemhuis.info>

On Tue, Dec 16, 2025 at 11:51:30AM +0100, Thorsten Leemhuis wrote:
> Lo! FWIW, Nick Bowler (now CCed) reported that below patch fixes a
> regression for him caused by the commit from Esben (now also CCed) the
> Fixes: tag mentions. See "hwclock busted w/ M48T59 RTC (regression)" for
> details:
> https://lore.kernel.org/all/2t6bhs4udbu55ctbemkhlluchz2exrwown7kmu2gss6zukaxdm@ughygemahmem/
> and
> 
> Nick, could you maybe provide a tested-by tag here? Maybe that would
> motivate someone to get this en route to mainline.
> 
> Adding a "Cc: <stable@vger.kernel.org>" would be great, too, as Nick
> encountered this on earlier series, as it was backported all the way to
> 5.15.y

It was backported to 5.10.y and 5.4.y too, but only after I had reported
this regression back in October (and I guess 5.4.y is EOL now).

Tested-by: Nick Bowler <nbowler@draconx.ca>

Thanks,
  Nick

