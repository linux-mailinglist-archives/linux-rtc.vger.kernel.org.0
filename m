Return-Path: <linux-rtc+bounces-5126-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ACECBBFF289
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 06:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 433324EE107
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Oct 2025 04:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F91425EF97;
	Thu, 23 Oct 2025 04:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="Dyt2IWPg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4557625A340
	for <linux-rtc@vger.kernel.org>; Thu, 23 Oct 2025 04:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761194718; cv=none; b=HqyfzX+G8Njn7JgMsQg13SzFf6ozvHeegQkmFEAIP3Pes+g6+hO7KQ0h82Exx+vuwX19ue2h8rYHj7tPs/Al7dnJvdaFvUYJnM047axCMM+3jPTCF6b5ImRq7qyCHnL/rbdhhECG90ivXPjPIR6NmjhkgaYlPJOzLmlsdDS3V/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761194718; c=relaxed/simple;
	bh=dDXZ4wlWh0zWE73CQei9SNb/wNKyNyNkdvTY21hhmRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtC0MuUiOTdj8slxCb8519dULUr9Z+8DfD3kEO9xaEa8jvDA2Kx99psV++YakvunaRPpziHj3zIAP1Lf7fE5EAkSKX2Iq//EbL8vm8GnJ5hk/km7etslcyGPcbWyvjDHJrW32FMlf1H3990VKEuO4p43yOAoSqrxx7eA9KeCsa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=Dyt2IWPg; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4e8922b1bfaso5250941cf.1
        for <linux-rtc@vger.kernel.org>; Wed, 22 Oct 2025 21:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1761194715; x=1761799515; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxAw5CcaNyJRUdL9g50f2nQhs9yBUN9LI3kQV7R+EXE=;
        b=Dyt2IWPg0y/LKwDvPqfaV9Xtam35tvueaP+OP11DwK6jU/oWLjgKA4JStUxKiXWhXI
         mN9R2jUP62evu/BI9IqnT3obgVXIYRL6wBx90qrdlZsM7HttlcRrfAKGhjyuj3jhJdDp
         2uBL+XRCQ58eAExxWgdfjk3eoqSow2TEf01btZVuPqArM/gAVPnR6USX8wA5FNket3mb
         rO4R3RTF7vA5AjJNeuNlBRhOpZcwahpKqcm5rdrMc1s8DWNw4SD5I0pEYtv8dtZomriV
         4tr6QhNFo8cvAkvdtg7CcsCs7tncNRF0OZBMp+Q5emdB6euthCM9gqJlKJyaEB7hhpme
         lqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761194715; x=1761799515;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxAw5CcaNyJRUdL9g50f2nQhs9yBUN9LI3kQV7R+EXE=;
        b=Hl0sHja1FhDUe5pHkdz1s/v82inn/9bI+sWvpERhKVxe6r7gtwUocH0hyrqN1atK+B
         3+pxCVmiLe9Jew11jdrsYQDnJOWNgP6Z5vQ5NUc0kEksgMxm7D6FA37UtVHU8o9E0xHR
         35LnwX/k7TW4ztGVidLiIBwtz/vsNLdvb6wyKHXYYXP7T1kylgNa7e2pD9RZfbxYHZn2
         E4zR8LfI8g8ra+C0ofqD6YhRg7liWY216mzlVcJf6WkmXSRgZgG1QzwqNjWZYNbYjPMo
         7BimkEaJaS8oUPJJPtM9lHEAiNWjkAWGZvDoAR1aGh8SSg1q3ERr+tMffdBaJJPkFlLW
         OwWA==
X-Forwarded-Encrypted: i=1; AJvYcCUiPzHMCgLk6BVdQNXE6fsjnPF9JJKNxE8xphG9G6w9GzSHLSuXPvafIKz94+0wolxXpNx6qF7FTOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFhy3zUbR73FoHAXvpytEUxUZFtjl+SpjQHLwmyIqO++ad+Kki
	g0a1+3rqnTMg/Mv5HAz67zx1waEuyct8CjiXLnRBdikm1cxRa9+NA1lIKKTUb/uWftW8Imosrb5
	N2GqXvuk=
X-Gm-Gg: ASbGncsmudEvXl4bRnPx0j47SmSgocLVpNvHmJ6YJMzEb3c7OornmTZ7cJ/GjgzsZOP
	pF/bFL0g0RBwhdTGgSqlqaHWpht7K3rhuFI8GGv4oN8KxWv7qFriKovj87E2ZWBgTf4LHnF7z+E
	1Fs74nQDYxAwrx7TLWB1ZKf2P5IzoxKoctkZhDHf/JWZUCf4/mw+BKB+Qz0L93O0lz/CIXipMJy
	mBrOVaa8m/w9wvZTofyw4Erg5NWqQA0IfuXZZWMcRb5PkUv0kXe5R/ZFM/Bg6igaIcq1lrymMXp
	8Vd+lo8s5pgMPq8ObadlaQFZjACrugJQdW/ogt5IAlSoDlZ+6lfXKlZsZmyPLN9AhG+T5rW3sYP
	C7s0DMGbJvbBGDU3RUz6KEGFo49KAUPA4F4jADAgK9IVl2XEKgc1mSpy7DH96v7oFZ4dLucRN07
	HvUxCR7Osqyc8OsqIvANMfpFE4du38yQ==
X-Google-Smtp-Source: AGHT+IHAxwX1q4xENozHdVwqKqZ7TDRt7Gbja+SgOkIQM2H6Yykm4zUm83IbTesCfNfk5IdGOKlPzg==
X-Received: by 2002:a05:622a:138a:b0:4c3:a0ef:9060 with SMTP id d75a77b69052e-4e89d27666dmr281053671cf.26.1761194714911;
        Wed, 22 Oct 2025 21:45:14 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-89c0e688d64sm87480285a.21.2025.10.22.21.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 21:45:14 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:45:13 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-rtc@vger.kernel.org
Cc: Esben Haabendal <esben@geanix.com>, stable@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

After a stable kernel update, the hwclock command seems no longer
functional on my SPARC system with an ST M48T59Y-70PC1 RTC:

  # hwclock
  [...long delay...]
  hwclock: select() to /dev/rtc0 to wait for clock tick timed out

On prior kernels, there is no problem:

  # hwclock
  2025-10-22 22:21:04.806992-04:00

I reproduced the same failure on 6.18-rc2 and bisected to this commit:

  commit 795cda8338eab036013314dbc0b04aae728880ab
  Author: Esben Haabendal <esben@geanix.com>
  Date:   Fri May 16 09:23:35 2025 +0200
  
      rtc: interface: Fix long-standing race when setting alarm

This commit was backported to all current 6.x stable branches,
as well as 5.15.x, so they all have the same regression.

Reverting this commit on top of 6.18-rc2 corrects the problem.

Let me know if you need any more info!

Thanks,
  Nick

