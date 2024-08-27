Return-Path: <linux-rtc+bounces-1746-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C3960CC6
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 15:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0824DB23F29
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 13:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC861B4C27;
	Tue, 27 Aug 2024 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQPEgOFZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AC273466;
	Tue, 27 Aug 2024 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766997; cv=none; b=AmatE4BtRfcS5RjEPtgskzZm4/HrBUxeo4PeEekH3Pz1a2IQRrZaGpdwXjK8hZeu+ITDCmVz/czxQK65XAvOcQ5oGwpeOBuAgposFmSwv3kw6j+Hcm/S1m6EZi1uow4c48p7KrJhMAbZBFOPgl9sp927vPxH6U0gljWys+gl11E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766997; c=relaxed/simple;
	bh=cknfo0uYa67fKSrOF4/7rAW/7KAGVQ/PEkxCS1kTQjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qt/wyVUgRnZxL3PUZLczlQQSj4TtUeG1nO3TsTaxUupMDlmToF0sFaCSmuWIFfGXEeELfI0FbSR1mnRUUWCNXiV4orEeXjsNYU0PZXVULQYeHR18drQlXPEkF776Vgs8OxrEIDADIvs4rGq5p9/rTPE2C3TIFgNj//TvOOwNl1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQPEgOFZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so48025445e9.2;
        Tue, 27 Aug 2024 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724766994; x=1725371794; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cknfo0uYa67fKSrOF4/7rAW/7KAGVQ/PEkxCS1kTQjU=;
        b=QQPEgOFZtcczeC1r3N2GddIe69IaxuYbwuB/nqiq1fbR+B/aEWvtMbQE5c+huOG5NK
         WpS/yvk4RNQnYnNbYMXyd9zENCqXhWo2jMAaG00QWOTcev1XNPSijGcMxFxle17i2jXg
         U+CrTjcUS89DRhiebjqVHf7PLBy0T9a/g+fgAmUkNBtSz7OoKs9ai+oqZmdsSdJStDyr
         Bg10uRTdD7U/ts+nAM0iwY57E7U9hVE9lYLHj9cteqjWc0RMBWHJk64dzQPktyEKBg0c
         3zboHw4KrNLxVT9FB0c/INyAulCu1eFdTFpY7QQ8NY5PWofXCDLa1Lqp8QG5xSKcK5IP
         J9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766994; x=1725371794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cknfo0uYa67fKSrOF4/7rAW/7KAGVQ/PEkxCS1kTQjU=;
        b=JXzIBDiFQApHGtl762SsxkkZiqRHZMrWhsuxk/LAZOLqylBHFcNQVIhmAKZ5Nt14v1
         qpX0AYc/P+D6rEFNVpehGngKhr+FF1ABtsytyRZrZ1SzZ7T2crfln2t/XFWyXmPgHeul
         UiXV3JUGKZJL/++H0I2CLAWGpWQkFi1fXsFKd7cyveKIGTxOFpQ/fWYsoaIobqBTHl9R
         Q58yfhYFWAkFySPak8FP9SRl/H5gMl88iOIpwhDyVJaWewx331zeJEZSKpPO7m+lOKCa
         b+60DAPFI5gJnm/jVwypZguxshWdN3bu1j5APwG/x8WK+i62y68UjWTkmvGZVWROpAvx
         qSLA==
X-Forwarded-Encrypted: i=1; AJvYcCU5aBFSEMTN+RJs9G0VNoCLVQGrAQN994yG5+NrSGAMPMG3dSOe9h1VoIaZVDwH6bNF2J4M2fuGSJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1W37wu97InFDQ09fjJu5MwEmJZC+gtHvvsFeaiJD2gNACfrs
	73RYJBFtLXmauVI37Dxl6enHmAWzxl2BGJJMf128n0HOdmUe6FV/
X-Google-Smtp-Source: AGHT+IGEYswGURViwA8slUwO3EvnrjKYnqLGFdDnqCaTWIhvBYt7Nm0mFpipLYm1GDUpwWjaUpecYQ==
X-Received: by 2002:a05:600c:3553:b0:428:1310:b6b5 with SMTP id 5b1f17b1804b1-42b9ae4745emr21829695e9.34.1724766993708;
        Tue, 27 Aug 2024 06:56:33 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abeffc622sm225148075e9.41.2024.08.27.06.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 06:56:33 -0700 (PDT)
Date: Tue, 27 Aug 2024 15:56:31 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	csokas.bence@prolan.hu
Subject: Re: [PATCH v4] drivers: rtc: Add driver for SD2405AL.
Message-ID: <fxnxreidciuirwn4ail2eaamsstuoyqkdgjss3a66yj72qfls2@nlvzm7xolxzu>
References: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
 <20240826232949440fe798@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826232949440fe798@mail.local>

Dear Alexandre Belloni,

Thank you very much for your review.
I will address the issues as soon as possible.

Best regards,
Tóth János

