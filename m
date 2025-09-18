Return-Path: <linux-rtc+bounces-4981-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB887B83E82
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Sep 2025 11:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91C0E1B25EBF
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Sep 2025 09:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D80E29992B;
	Thu, 18 Sep 2025 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcEVHo+b"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B6F27AC4C
	for <linux-rtc@vger.kernel.org>; Thu, 18 Sep 2025 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188995; cv=none; b=FyymoL23PPN+J0+EDrOfOhUyYa8Qg88Tp41s+jsODxPShQq53OyyblX3cGLPgbFeqXfaPmRPw28MrgKIQjmifolV+Mhyq9KwHC1Ecfj3nM/xriwrf3RvEps0WHFIVKapPznsHK2YQlWBZCXznJMGNU5OKv4T3feLwJe3RvNT5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188995; c=relaxed/simple;
	bh=pmKMdMwREhDVJrJVVTTvY6Y6Gzyv37bc8Q/TErqBVNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueOZCt53ryasNWUuPh9ggS7AGNzyb4pdqjKh0iwAc5gG0x9j91sRMgv+madgPLYdxEUMudNCzLjsNS56AqMwLMm+qff8+kQjxPIw5lbVl+ZwyRl87BzQg+Y8IQ+QpHlGtatlZeMhHKNNR0n1j9j2rT5smC/p+B7/s9paGEbhT7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcEVHo+b; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f2b062b86so4070785e9.1
        for <linux-rtc@vger.kernel.org>; Thu, 18 Sep 2025 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188992; x=1758793792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/gbtAHMr2GW0/OahgiAYUZjpkj23jMbWY9WrggA8X0=;
        b=pcEVHo+b5EGJhi6LpZy5k7N10TOe/7p96AWo3+WvaPa0+y9oMMDTYGdvZXdCtM1sZj
         ofoctBLYOCgCoN4W3vzL8yPM/sDbuyKByQhFfZXe+UDE9BLUPERp8jU2EG3nuYoL2z6G
         +fvqucKVpv2hqDgo/b4q+4GAPswY4r0HCXL1eykuImDxxiiYMlH/0TOmuCbd84dWyuGI
         otX/AVLoCb5ayqtLP9mCbY/mpZWP3TIwtaZ/F1W8ifGKJlL/ieSRue1NTVFWMEeFzFVD
         qTiyR5CnbzIKe7DqJ70NHjXXsTUJkAqzxPJmqrozedifiNSspc4ivqex+YoNscP2gGBI
         O8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188992; x=1758793792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/gbtAHMr2GW0/OahgiAYUZjpkj23jMbWY9WrggA8X0=;
        b=cSgCSA82cB9v8d9Ra3O3a06DkMTkjrMycP1NKn96y7gJOz3q4nNPG694cr9xsKfjMh
         EzAikBSSgXVSFm1snKNCgnhajHd5W5jqEDsVGXGUWSRVHmzU1GzhQf/CsakouGuzV60a
         BuxmFKUyYQvPnj9eeT07HeqoQPXEzCGd5811lkQuQK6WinkiH1vzZMhKF8iZoSLXwUFT
         bAs5fzEzeGKT0K2JbJ/1ko1afApbJB9ozfXv7kmPzliNIpJLzLLLXRiAsr1NXcaNnp8t
         1Gm7eGrqES89JqV/HZqB4qwQCGkzb3XMDduriQbV9TtWR8nMveV3QR8jsWJtUlF+E/ar
         S8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUSdylXOc7z3t5ikMNitjRIDptFymEbMz6d880Gs4JBb31ojKys88Cd0A2XqUOYBjHipCwXqKEaipo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqS58MUcIU0Da3lLr9KSpCUA2vzNiwlrnxN1950UcpegezM2Bi
	KiH9qORrfNIz83Lna4OfZqF6b/fMSleSrmg+lDFmTig772/IcPh7/W28cihvukYlRpQ=
X-Gm-Gg: ASbGnctBx1cCTRzo/LppamJibqR8y6fRrYEPJg52uLI7mwrkNZYDENtOkqgnT4Q0mIl
	gfWU2ws+NB0SuJEFeejUh54PJTWnNezxolo7vbii2VU96O++Py3ttW8zBwPTwNDun3G95aIzc37
	YCGeWe2Te/LcwlIrpJceyk8bD+zcO/irXTluaiO3hpX+WrQ1GDBcRMdZ3voLOQwoavA1D25dC9y
	JCykoLGnt82IR8WO3vr6SOdRCSSbC7tR3IX2F4kZ0Ph4SQTaRumuAyn0Sc53CO9cV7eiFVKcY4Q
	yL2543QKgj4Lj/JNc37nVHm6lx+51lJ4m10QzXT9nlXdfkJtN4+fq2uZIbjIAY01qwbqOkq+cbZ
	ZnQ6Or7K6cEaFMr94rKaELQM6GkxdlLkH8AfPqlAKAf9BCg==
X-Google-Smtp-Source: AGHT+IGxQiegj2o4mPFmZMrmoIXlBv9b1w/nkqkoOE8IISbZ7wbuT9+6TsbLyb+3Ro80AXibobzQxQ==
X-Received: by 2002:a05:6000:2284:b0:3ec:de3c:c56 with SMTP id ffacd0b85a97d-3ecdf9ffa65mr4464540f8f.16.1758188991925;
        Thu, 18 Sep 2025 02:49:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc72e6sm2816898f8f.29.2025.09.18.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:49:51 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:49:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: optee: Fix error code in optee_rtc_read_alarm()
Message-ID: <9e3718fe1128964907619ad325c0c5f5c1354ace.1758182509.git.dan.carpenter@linaro.org>
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

Return "optee_alarm" instead of "alarm".  The "alarm" pointer is a valid
pointer and not an error pointer.

Fixes: 6266aea864fa ("rtc: optee: add alarm related rtc ops to optee rtc driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/rtc/rtc-optee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index 7b44d7723cae..3d5662aa1bd8 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -299,7 +299,7 @@ static int optee_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 
 	optee_alarm = tee_shm_get_va(priv->shm, 0);
 	if (IS_ERR(optee_alarm))
-		return PTR_ERR(alarm);
+		return PTR_ERR(optee_alarm);
 
 	if (param[0].u.memref.size != sizeof(*optee_alarm))
 		return -EPROTO;
-- 
2.51.0


