Return-Path: <linux-rtc+bounces-4980-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 289B5B83E7C
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Sep 2025 11:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4DA11C034D4
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Sep 2025 09:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772A0279DA1;
	Thu, 18 Sep 2025 09:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p4xM2G1l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF661F4717
	for <linux-rtc@vger.kernel.org>; Thu, 18 Sep 2025 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188978; cv=none; b=st7C0uAVsQueXPeqz/BXkBIbn2CLH37Olcft2NQ7h7F/CARqShlWEaRjzPe+SYri60UQH1n0hSX0PIg+jFPRv4gg/oeQ6pnio90IGLnGVu84D/a3zaLZmYsBB8jOJaraxdCcmzwVOHjq9oid2IImlLxEuPyJ19I8kcFyKTmLyQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188978; c=relaxed/simple;
	bh=3o56CLgvmgPag8A4vMxEiPVC1yf8tz2FMWmVX/FqxeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zaqpe0adOteN82J63AnbUTQ5KK1FAt55V59X7i/ntdeLgMZ43jt7ogUe7o6jk0aZBaPxM5WSNCA7z9Y6qO216+k4to8DxO/snysAgJ5N72Fq3JPAFRaibEtrU64COa3qeO4Ylk3wJHZc71BKB6nq2Ymfzm+ShytHYahd4SdCBDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p4xM2G1l; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45ed646b656so7146425e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 18 Sep 2025 02:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188975; x=1758793775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PqbzaR+aSDa1IRdnchx48PeU4U2kasDrWmTKBAeOvOM=;
        b=p4xM2G1lOPLeoxEiFURzEcOmwoU/wA7HJ/AwGVkuHFYwo13aZ+ah8mCdQCfsdKvE30
         hFMRIXyA/Zh9pzVNJwSL9VNsUQtfWfrTPQn/hFqn8pHyQSDWtEQYAjuLRr6LLnE7mRCD
         OR6CCrYfQcznt4kEdBnZ+bqefQJvu1I226zfYaalikqNWm7o8KhNr4bEvh6qRVQLM8St
         IJN11MNKkyC90I/pYLzFToa/LBVRuKeu0SmXMsMmq6GTAUu5N2kb0GXkT3ohZx2XfhrB
         MqhhBwsH85EZYdHoZv2RybuBMezy+j3f9dwM4ZRHkkbD9C4VglN87E/Bh6F8hMMtvm9Z
         162w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188975; x=1758793775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqbzaR+aSDa1IRdnchx48PeU4U2kasDrWmTKBAeOvOM=;
        b=X34Z4sqUU62Na/51gcdaVUlmrqY3vN83jptR5pOqlDBb0bCi078VpsNgbqfoRKlb3V
         DRkZR/WuqL5g2FM21SFRIKBXvX75vEGHgwpu4BJ7dbJ8RdTdXAH/BJuDpBKUN4KgywAB
         j+v1kOtE/VEZHpjsQ89hWrlvhENXD6lWZberEbue1irzwfaGZ2JiAg5cSGtg8jpac2ed
         lF2+upD+fqex236gSRbRbrmHchpnysokhWPSub5jsRvRr0bg1791bozy3SJd4X3NttpG
         nLhc6Qs1hmUEPknfl8nSjhayJAlPIYewCMLTeU/AKqXcq3MFvRY6BxDXpD//2o2jfJv9
         R4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCU0/MuKf2df8dHsMFH91wdscR0gVUSnguXgPO8JLY0sb5NcmZ0A/IWji+stNBrn0ihB3ejEHus1Cgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOPi7/EYKFGN4jaZHI45fI3etI+EAnjft9Om/OVwweOn2KU/ij
	nujP1uRmblJ8MNw3r18gDl4mzk53A61nO4/UHrbMJ3PJFiB3aeBmMzHvazVxAEnF2lg=
X-Gm-Gg: ASbGncvKytxUCeaRoMUOy8s0Qkw/ele1qaoBFPY50s6m05mWtZf77aKQwlVsy44uYnu
	ENk7f2AT4Ct8idxYbzU1h7iqTsumBOa33a1HRVCpX2ae3+QnsZfw6WlHG2ZnbaMLVACHCP+kIeT
	gapANyfNdtFup907fu/U1E0Y9IwQ5IpH+AR1HQBKS/UxDjNnnZCxV3JeN7c1v0fi/cLJ7avXo0/
	H6a6Faf9fFyzVgcizAG7EepP7Q33YugaEILafwQDc75RbuokBkcSk3BPe4mtzl1uNxcFzjmvGLN
	OAEawDkqWotF8LD3K3EAZOosyBbwHxhdmW/8d030okc+nC00dUz1Z2d2awFQrgTeS+Gim1X16oz
	NkqMbsNDxXM2Y4JH+EyzlR9WwcNlOwJaV2GCqsIQdPmkn7g==
X-Google-Smtp-Source: AGHT+IGbIEyWGArfQ6bIC0wjyNujy6C2tgvTZnbiw7QzzYpR2AwNYnUW7VenJVSX+0UxS4BzkMynCA==
X-Received: by 2002:a05:600c:1f13:b0:45b:9961:9c01 with SMTP id 5b1f17b1804b1-4620348f559mr65916175e9.16.1758188974845;
        Thu, 18 Sep 2025 02:49:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f4f9f339sm36841065e9.14.2025.09.18.02.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:49:34 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:49:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: optee: fix error code in probe()
Message-ID: <21f1a18008f1bbc8f70d0bd5c05b72fbf5fc9c7d.1758182509.git.dan.carpenter@linaro.org>
References: <cover.1758182509.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758182509.git.dan.carpenter@linaro.org>

Return an error code if kthread_create() fails.  Currently the code
returns success.

Fixes: 6266aea864fa ("rtc: optee: add alarm related rtc ops to optee rtc driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/rtc/rtc-optee.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index 27db403e3047..7b44d7723cae 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -614,6 +614,7 @@ static int optee_rtc_probe(struct device *dev)
 						  priv, "rtc_alarm_evt");
 		if (IS_ERR(priv->alarm_task)) {
 			dev_err(dev, "Failed to create alarm thread\n");
+			err = PTR_ERR(priv->alarm_task);
 			goto out_shm;
 		}
 
-- 
2.51.0


