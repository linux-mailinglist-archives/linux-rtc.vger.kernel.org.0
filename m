Return-Path: <linux-rtc+bounces-1285-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 674E1904F20
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 11:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ADC0289139
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 09:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCBA16D9D7;
	Wed, 12 Jun 2024 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yr0/iviL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382916D9B6
	for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184193; cv=none; b=IceLsZwFsqenmJo+xlhMh66Tt7D7j4RR52zEXCIEFby/+cB+WrVkdW55wE6/Agj4BX9D5mw/HWcS54V8Exmo66/nhX9tNtue2N8SQtlbA2b+wdlu9hQ0m9Wa2jT50qXX1CpI947fxLEMLnZXyYpWWnvu4JNT4fS+4aT1mGkGI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184193; c=relaxed/simple;
	bh=L6aQlkYdf1XjFaD3aaJ4kmtrRKD/GnbI/GjZRBMbZjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOJkphCLRF8uICcWiV8HRQxgbZan8bb2nyTSGwZ01B9dCQ0WvtxNpktkE+DBpUY2sCU4vgRe0cRxVcai7+xJNZzeWbrWoSHCYQTdYJxpqHGT6CmapS5Q9uxjhPKKi1Mve+zgliGzHhcTzvF8vHX0uBSZA7XO/9JCaTG58SsX6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yr0/iviL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f22d3abf1so3086466f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718184190; x=1718788990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=px3FWD61KwYUoVLXs51y4wh/lB5F1voz4oJ3Gukra6M=;
        b=yr0/iviLd0x+N6izlpoVwFHchZVFq0+B/C4HXaQcEE9/WbMxy9Wjm21AtJpmPeLL5d
         aO5VI1CC6NBddliXGJS+J2uZjOGlV7ad3uSMWNYb+Fyk8INe0Gw7fbfRqjCZTyl7lOMc
         k23dAlQk+wIyN57fIHhkxtULBXIVVXCCjqIf0kv5SF33rv7nsyjDYr8l44xaHmJMh9/v
         xFm2QtSj8xCGVkTgM2mJhoqj0KlzYfRyf9/locAICanKC8TQPmG1+o8jR+rMF/o+fNiH
         WkrnX8bQkrhPdnawTqnBuMEQTYk/Xy3mMfJy7RRN2z5BU4euqLec+NwN4rBccdkoj+ob
         aPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184190; x=1718788990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px3FWD61KwYUoVLXs51y4wh/lB5F1voz4oJ3Gukra6M=;
        b=He53ZGRx0pOsMBxxu6IrdnfSYAxUnxvJfRrSAuriJlCc9n12D6GXxwhEYHd+qge05+
         Wz9pZ6Vj0G0KLy4vJ3Yqa697ijtaxmJsCtTpMKafwiDK542GRPP34IvZObXmmNKzIFrV
         Q4tURLTmCxNz8GPVzOhBUw4Mfyh9pBfZN/RFUkS9KmbQtXWjLYY5n6/+dv4QQ1Gd1Hs0
         O8I8YO9gmzTkred7bA9eeA8tuEwS5LytxnSDoj4SyqeU2eaAwyKHuO1lDRMFSCIIs1vv
         v8t2LaZ7OpQDcWy1/feBcL+RfWfs+XnoS641/uYpyAdWcC7dxRTNk41I7Lrv2/Wr6p/c
         1liA==
X-Forwarded-Encrypted: i=1; AJvYcCV56kuZ9aTNoDfId/QjubElXhZEyXw4TCY0Eigg3jRCsuj9wdG1zq7DJanLYlGhSsUO6all2X8C2EAFc2E3mK8lMd5kVVKbS8YI
X-Gm-Message-State: AOJu0YzTOv6mMw0jGQdDhdiX61kzSGiz1OCVKv7niZ6lIy2Oyk24Itl5
	uqnWQCAWeNp2ZBIpdzA3tuVZKkwF3wQLfZa7b5j9VyInSl6IhIn631+R+Ny2OJU=
X-Google-Smtp-Source: AGHT+IFOMCjOwX/KFQg+pTTAbiYMRIrI6LiOBW6EbiPB1eB/0gA7Kzf223cvhK/M1n6QlFI50LRw1w==
X-Received: by 2002:a5d:4f8f:0:b0:35f:1cec:3cf with SMTP id ffacd0b85a97d-35fe89395bcmr1062754f8f.65.1718184190317;
        Wed, 12 Jun 2024 02:23:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2598ac1esm7109636f8f.93.2024.06.12.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:23:09 -0700 (PDT)
Date: Wed, 12 Jun 2024 12:23:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: Fix return value of nvmem callbacks
Message-ID: <f2156a50-0ee0-479d-8d60-3255f3619ae5@moroto.mountain>
References: <20240612083635.1253039-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612083635.1253039-1-joychakr@google.com>

On Wed, Jun 12, 2024 at 08:36:35AM +0000, Joy Chakraborty wrote:
> Read/write callbacks registered with nvmem core expect 0 to be returned
> on success and a negative value to be returned on failure.
> 
> cmos_nvram_read()/cmos_nvram_write() currently return the number of
> bytes read or written, fix to return 0 on success and -EIO incase number
> of bytes requested was not read or written.
> 
> Fixes: 8b5b7958fd1c ("rtc: cmos: use generic nvmem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

After we fix all the these, can we add a warning once message to detect
when people introduce new bugs?  It could either go into
__nvmem_reg_read/write() or bin_attr_nvmem_read/write().  I think
bin_attr_nvmem_read() is the only caller where the buggy functions work
but that's the caller that most people use I guess.

regards,
dan carpenter


