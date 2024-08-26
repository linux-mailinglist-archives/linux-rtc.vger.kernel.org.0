Return-Path: <linux-rtc+bounces-1740-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6A95EE65
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 12:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E3A81C2167B
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 10:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B68D146A9F;
	Mon, 26 Aug 2024 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5s7nAdj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D514D146593;
	Mon, 26 Aug 2024 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724667696; cv=none; b=OkTPaJccsEgtVSwPmd3X5W6RlO7ToQXi0m6/mdvXpXmtHzQlA91HLd9HAf1tExMD806hGplnuro1PDERiQfcSfZh0RP74KeofNHcVAy4jFKYE337lD4ZRZu5ISRTlb8rDDXlbc8dEuqMOkLMGNpj5iarND6IuLEdMJK3r2re/7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724667696; c=relaxed/simple;
	bh=haaRV450AsbSM4F3hziAV9r8cmTxOMfG/huLfNYSdZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr32jXpitvq49tcK2h0Fl/IGcVuILL4Q8F08+GhiW1eZ9FQ6uuf9nh29ycGtclWfq3pvOk4C6KexTXxUwNR1oKBxu/90lwDqSleXUfhW8+RgRyx6p5i+UsP+q1biFm8ejUeIM6ojaNpOqLKTa7zcDl+dTQE5YqE6cA8m7Mpr0CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5s7nAdj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a81bd549eso296572866b.3;
        Mon, 26 Aug 2024 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724667693; x=1725272493; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=haaRV450AsbSM4F3hziAV9r8cmTxOMfG/huLfNYSdZY=;
        b=b5s7nAdjbe8+7kFZ/B3qHp95/qBghCa9mFe2E5nF+Z8u68Z1hEsTAk0OFicYiTjMYW
         M5aiCMP1/Qc669GuKndv9FFZtyTur7LfSARfK+LYj88Wz/2HJc2mUWlKhFZQWUI0IK2j
         iADKDdlUdnOGJI3RcDNtf2aJs+MX6UcSAGDdk0VI5//0f9e2aMJOrIOHU+MPXsDdP2xp
         tT8EpGV7+v6jB7dfqJw9F0EW5YkbiBgA5e+QkHMCahI2gUBDzRx334RJ2OWI4uNnC2i4
         60qBDXOSINvXfy7Ei1TgdEYcFVeRT+aooDQKwoj1xvqp3j5HXZpXcx7TYsN3lsUINWsO
         TxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724667693; x=1725272493;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haaRV450AsbSM4F3hziAV9r8cmTxOMfG/huLfNYSdZY=;
        b=dYshAx2yw0J9VCEIrRIc5KPH8XysOkPHOlRENIeLgSs78fzbNbAXyQXwt6pItXhx9i
         AnUdGWkufnGsqBCB+BIGroyBiikh5iKo/w29oEfLYrqxtXtHgDMMWx/YauHabjbz1sIm
         iL7C021MyksbYRv+Np3ps97f0MvRIiAV162VB5SSgxN0SKOp3D1nOYiNCTE7/4k0I25T
         Q3mOLWJwiBXpZIaS5+5FSo9bICgfXwxx+E2rtK+JUHhn+ocLJiCo/YB2tCNV5m0vImdL
         RWN0AbdxnV46u0ZdFjpVZIzeRdUDnpNFUjrGVnXYdUbiJnMNKOMnaYlb+mVuCnfpQ3bR
         9XmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvSlK7vD+eFiYskXnd1rhoRtMoUTcAp5xSfo88iWpQ8atiPz8Px9c/+oW+5/tHm5Wj9vyVyxZJLeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRh80vTLA0RZ/1BLPZppj0FvNorYbsVW+FusRfoV0rgGjmJpub
	7HON4hAUOjyH7aGo0zzavtUQojpQqnn6cBdlpgTetvKPSxUMmSJv
X-Google-Smtp-Source: AGHT+IGy+0SqY7+E+NwLUyVO1/NHEq8jjctrgVTHu2sSqiCLbAPLEJlevhJ3TnLNYssBrtlRRKO/wA==
X-Received: by 2002:a17:907:2d07:b0:a86:6a2b:3e57 with SMTP id a640c23a62f3a-a86a52bc9b5mr765458566b.29.1724667692626;
        Mon, 26 Aug 2024 03:21:32 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f47c512sm641514466b.150.2024.08.26.03.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:21:32 -0700 (PDT)
Date: Mon, 26 Aug 2024 12:21:30 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4] drivers: rtc: Add driver for SD2405AL.
Message-ID: <nuieayffpyac7a7gbgogztwe6cuuxa7p43altngans45cjg76k@jnzez63ip7bk>
References: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>

Dear Maintainers,

my patch has been reviewed by Csókás Bence.

I recognize that you all have demanding schedules, and I sincerely appreciate
the time and effort you put into maintaining the Linux kernel. However, I would
greatly appreciate it if you could share an update on the status of the patch
and let me know if there are any further actions needed from my side.

Best regards,
Tóth János

