Return-Path: <linux-rtc+bounces-1749-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3393B9621C3
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 09:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4FCA2856AC
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 07:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8941F15A85E;
	Wed, 28 Aug 2024 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X80jkEFa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A8715A85A;
	Wed, 28 Aug 2024 07:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724831416; cv=none; b=OSmAmx5gWrNXGRbTYW2WtB/qV0Pu4XuE0IrkVa4eu0tyfZER7HfM5O2rzqcQsyJXe20fdrCCbVrT4xrJZ8Hj+pjQaACh3/CKOnQ6MF0DvqaZEWblZ099Jkhq6O5PPpFC+1Kg+7Gm86HKfrFC5Pc34Gac077v1VC7x+hdUsa2A6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724831416; c=relaxed/simple;
	bh=4u/o3jz0rGUN/i796XOblvYykihNNT5p7Qm6lHPTmUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfBl1n3H7lbDYvAaTjA5SyoOFEqXWibHOfZa6YCzvtuiRH2/JpP+BaHp2DTuAuZLntFY6dCh93tqZe5bgNb70SQoX+0J4dfQcYkNhGEEj371ln4RpvlohupnDUZmsJ5F90E0JwzHC3iph4ReQIoJQTj7yVvlrZwg8hA/usImdBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X80jkEFa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37198a6da58so4414436f8f.0;
        Wed, 28 Aug 2024 00:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724831413; x=1725436213; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4u/o3jz0rGUN/i796XOblvYykihNNT5p7Qm6lHPTmUE=;
        b=X80jkEFapxK5YUKeB7B6DHr7f7KojXGDhwSFjC1/yEboKf0DRDkxTl5J44//YG07el
         atfw888Ctl6swHxqm6tnJ6OKNQbT6OJtLXDDQ/F7wGoPAi+W/Fp3TS6v1hwjRSDBly7B
         YYH8+9eUcxBDgx5C7yA7B/90pLDHCsH7IDthM0eKlPoRfuoPewtFsbBUq4iZmitifQEc
         Y9VabEClHl/mQ8c1gtPFL6fM8r4NWO8nlvyAvIpucPi65mFS/k0gkbQ+Sj/cxEBiVtip
         E7uucB8S8eploVDapD3xF2bmMwIY0aRTiepvTI0M2YxIQFeFntUkZThU0QGlKKd0R8JP
         l5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724831413; x=1725436213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4u/o3jz0rGUN/i796XOblvYykihNNT5p7Qm6lHPTmUE=;
        b=ZAe4JOse8wZQy8h8aGCumHjI2hXjtV8hFbtKuEV1CbiyyT/H4sVxIALsi7GCqqd9Tu
         pbcabkyC9SHAg4plj+b/kxvCSU2GVsr0F03o9DLB9c4HupkX41DZLrqqRZnxtIwcXbue
         FDO98VHp5qS6LONrKQFsfBdqLsYuSnLNlFocj9BSylPC824GW87VS7GSJOCYiSuYd+LF
         kDBC3h8ut6PHRxRkDSXV6jwc8G3oB/69AYgcgyNjik7oq5NXY5zfj5QHl7hybRovZld4
         AJf1dR9DOKrcJ0k42SEzOQzFILKM+YsdmORGiV320GlsgvwLpmpNrgGBPTcFiFm334Gp
         /2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG+OSECJOyHlrP7dJ6tyOBYyMo8VNlielXtZDIasb+LewfV4LsWeS2JM6nxkjAEk8HCxbIsHehm86ZHVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIE837RKjfmrL2GN0O90SMNK3695vaX2Ibpl1XXC6pxilyOsF2
	2m2W5/Ntyjh5p8iVTjo9zsFJfPi+TuyPm3NNvb6GrnjSwypB4MxP
X-Google-Smtp-Source: AGHT+IGVcPo9usVTr/CQDzKuPHCUGRksVdQJZf4qTj2Gi03Fmx0fQ2P1NtoKprSjawd9SbGrtwYROw==
X-Received: by 2002:adf:f001:0:b0:371:7c68:7cd7 with SMTP id ffacd0b85a97d-373118e33d2mr12053159f8f.56.1724831412545;
        Wed, 28 Aug 2024 00:50:12 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639da86sm12330515e9.20.2024.08.28.00.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 00:50:11 -0700 (PDT)
Date: Wed, 28 Aug 2024 09:50:10 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, LKML <linux-kernel@vger.kernel.org>, 
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v4] drivers: rtc: Add driver for SD2405AL.
Message-ID: <emb6vrhqkeps23r6mojuhlqamo67lpxhv7sati3rnqdxvj5dmp@s67xvy4lyyyx>
References: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
 <770322bc-bd52-425d-a79f-93fde6157548@web.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <770322bc-bd52-425d-a79f-93fde6157548@web.de>

> Would you like to add an email address here?

Sure.

János


