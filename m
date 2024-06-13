Return-Path: <linux-rtc+bounces-1293-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D89070E7
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 14:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26A631F23216
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 12:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1BC1DFD9;
	Thu, 13 Jun 2024 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AuyuDpfu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087182F5A
	for <linux-rtc@vger.kernel.org>; Thu, 13 Jun 2024 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718281916; cv=none; b=Qg+D6mWxsMmfNc+egKUvK+vn9Xtc1aPl4+Qwxu6jrGhfJ2i+gS7eaSqgHsSTlqINOdpvLq7sRSRRxmacYb2L1gGHaX2HL20xIUfycWplYUVxZlqUtBEoxR9oBvIr0kmUl2/uqtE+P70ZIAnx8ZBuvOhSDlwp+FRZj82Qo7qnq+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718281916; c=relaxed/simple;
	bh=AZW8Rvb658mUQ4oySqDO6/NWFh58MvjugKtDExhrDBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFnkrIPYyK0FLSh4K8mZlzRvMlYpM5rEMyZmznaiH4ipmsx3wgxkzqAYAXyTbTJQabedNNzS7E5Fr1DZ9QOOzYcjgBgRhhsU+oqgvS5xPI1RiRcyiDrQuQuVJUcH8ha/CaLilyCX/Vr6AutAttc1WS5yeq5+55tvDdOlqZxuMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AuyuDpfu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35f1cb7a40fso929262f8f.0
        for <linux-rtc@vger.kernel.org>; Thu, 13 Jun 2024 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718281913; x=1718886713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8egxTfBsYw5OqoHOD9rOCey9G2kZmw/BykgzWMoY1t4=;
        b=AuyuDpfu8Wcyt0e8bOhAvpQu+UECnLOWf3OPPneo33z8yTMaD/uWEq677l1yD/+BAI
         4l/4t8z4xQ3ZHR+sLVBRRcIqL3GOrI+G1Tm33Wb/FVOq0ARhGmLi2jUNY9RFCZTFCUqF
         aT3JC5zOj1RmJ7ErAQyHxVJW3ApdS6bfHeqYamL2MWuGpF9WLak6ERa1PhjFJQK+bqe8
         ekVsr8lgjd5yWAV8sSiILRbmQgnjCadEo14DBnNSdclZMl3+XHn8k57yinEc9u1MSMLD
         9FqyBs70t46vtDtmXpRMc+X5pNXoJZYnQyfeeLdugeg4h8c3EeIDdXBnTrzqyNBEML31
         6suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718281913; x=1718886713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8egxTfBsYw5OqoHOD9rOCey9G2kZmw/BykgzWMoY1t4=;
        b=AiNSstIi/mmtcvgk8i3S4zON+yc6klFFnr6nanvcHsteHW85EbyiI87AXZeWKl6h2e
         RwYQKpFh8a6CACN/QvJEWwzXXYqPZ0RBM+2isDEHXP0Ducu1xoFHAsm6IQyKE5V9R+vQ
         a2KSyUu2/iOJ4RJG+mvNZCEy3PsSxA4FNg6lgxJgWuDNsY7/Gj91pxF4BPQs3XyFdLbw
         /s/5e7gHsocvelzNoff++Po8Rko+B9v/Et6XMtB5KBiR+xraP8BtuJoETCooPOSJ7am8
         fs4mNVkeVGeJepnFy+0KVVIA+uyzW8IkbrTXJ7e5zqh4Wff4EBRwUBXXVHzL/9fU7KhC
         GB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfnbGrH0/+rij9ta4rbyKKK/iG+clpeuobxHlklCrc1SM8dh3OB7fKPnaZfLEDKs3Atm2f2nnyoObJ4lNbmAkC0T9/hOt16NsU
X-Gm-Message-State: AOJu0YzJENeeYAmtcn2moL3gSDVLx3SFVN/rhIAnETBCxJ1wl1am5iL0
	Els5Z6NpKTL5xP1f5SFPYoeH9YjQXZE3xiVtrvUDtebukIkjrLSngZq9doiK7L4=
X-Google-Smtp-Source: AGHT+IGf+yrqH+XhL9ODE4D5Aoj64YLHx+2o1MIBZtpH9xcNUucehMkrP4QhhWTr6HcAn9HTxXlOow==
X-Received: by 2002:adf:f7ca:0:b0:35f:25db:b2bd with SMTP id ffacd0b85a97d-35fe892a4bdmr3952383f8f.47.1718281913230;
        Thu, 13 Jun 2024 05:31:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f22absm1656203f8f.79.2024.06.13.05.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 05:31:52 -0700 (PDT)
Date: Thu, 13 Jun 2024 15:31:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Sean Anderson <sean.anderson@seco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] rtc: abx80x: Fix return value of nvmem callback on
 read
Message-ID: <b961981c-14b5-469b-b356-2282019ada92@moroto.mountain>
References: <20240613120750.1455209-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613120750.1455209-1-joychakr@google.com>

On Thu, Jun 13, 2024 at 12:07:50PM +0000, Joy Chakraborty wrote:
> Read callbacks registered with nvmem core expect 0 to be returned on
> success and a negative value to be returned on failure.
> 
> abx80x_nvmem_xfer() on read calls i2c_smbus_read_i2c_block_data() which
> returns the number of bytes read on success as per its api description,
> this return value is handled as an error and returned to nvmem even on
> success.
> 
> Fix to handle all possible values that would be returned by
> i2c_smbus_read_i2c_block_data().
> 
> Fixes: e90ff8ede777 ("rtc: abx80x: Add nvmem support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


