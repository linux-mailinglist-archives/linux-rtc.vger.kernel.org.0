Return-Path: <linux-rtc+bounces-5411-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59CC6D0B6
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 08:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 48B0E4EA49A
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 07:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B442322A21;
	Wed, 19 Nov 2025 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNCQ1oOS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF3E2C3261
	for <linux-rtc@vger.kernel.org>; Wed, 19 Nov 2025 07:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536396; cv=none; b=PKNw2+qXcp/EjajLxfzVLu4+enHtBiO9sPi4aREG/P5LlRxD+OrP8euUvxIMTfO7SVjIegyj1pVDZ1wrB2GZMQw1r55IkQ49xyaaJgvdDNcwSF2cUCyab2Q4EWioa6UVAodoRXyVCm4XW7nUHs8Mirj/RgOplckXUEtqnsEy/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536396; c=relaxed/simple;
	bh=3ftyJeNEROOQRmpQz9ADffJrhoo3yBZl2kX9QuLh3Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVor+X5O/TddokqN2KvjX6INBkjXOJUDtim31wxO66nJVAgeMKJKRnWQjSHn61Ui8rfSkTPvsSjP8ceJBQ94ebiMuN/hSsCU5sfkdgu6uORZ97klcBDmta3C1yf7FIB12wOhrPiAXfg5AoDJgUBIvaVgPW41STuehyi/DZYxyHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNCQ1oOS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477563e28a3so3860005e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 23:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763536391; x=1764141191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEeop7THHC2Z4mZ+uFXO7gKPD1aZpuBWKQn9Nyzeq9c=;
        b=VNCQ1oOSyfLagq1iuX2ZH9B1+PsuW8CA3+dSAD7QIrJoY7dTluNQwbePanLXs99hS2
         DYBLiq0L3dWsuObl5Q4Q+HEFVa3CzEMLV8UcwYaRJcaSJPfXMeFf30O7k+P6YR0RYXvv
         Bdvk+X8r+SrqZUfBdeDAMx4a2BZlRE+GbBZsPTLdrXHEjEVSnQ/Ezo4Tn63bVWvp1/v/
         M84YKpJ/9hwJW7/66eah1yxoG88/+YeVv8sEXYHopxJvCFP9RZknJxmgSSsLhxxRO4Wt
         hB08t+jP6KrN97ODDwO8CTu+jjDNBRhjTIyEkfiOivt1NVA0g90yjZSxFlB+kMTksesL
         SOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763536391; x=1764141191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEeop7THHC2Z4mZ+uFXO7gKPD1aZpuBWKQn9Nyzeq9c=;
        b=eJ23LRwJ/KqH+sWek/BRu2gOewd3/8MPLh5yW5e1G9/rUCw6g0O1v5aAapRyYDZpo7
         8SC8RoBReh3yhCM6eASKNxqHl1frAWaKjAeH+5FXxTgt+LkFWKQQcjPhyH+Uxey9JgzZ
         /6UdTVWu6VfMFR2+9NYwrO46G7ne4EIwzP45HGAqNru3cgy8pJKb+1N8RDA7pJPsJYlB
         p2/lYrnZzTshYUXxt1ZmMURjFTukJ9GnTrKDLeRJoSRpmkrkUbNsskkQf7AB58IFDKXd
         pgCKghbnW1fK8V1x1MYZlj04inRAnj0oVCYV4BYuGywBSOLf6psut9wJ0BsadnuF+9KD
         X4dg==
X-Forwarded-Encrypted: i=1; AJvYcCXyETVAinq9SOjDSwD5/JfxJ4IpHSM87161SIJLC4HXi6tyodZgGE0PtgmhrI/sW8f/s3172M3q5eg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp65b+c3U1PKqAQWufaQ8hl9OXhdXom1t/9zNwh+N9Pio9ORA4
	G76Lc/apgdLRluKI+0vKA/0jTan1HUAS6NrumXC4aG/1VbWH5BmHuXmSN3Lyc6qDC40=
X-Gm-Gg: ASbGnctz4cNBRtGTHqAQQXvbke+ct5ZiDSpBNbJPKvsbyZ8auuouTUhGv7pIRi2exg5
	MYLqSLr2uHPc0wL14vivaH6X09UTCzsnzLBifpJM0KacR17eq1uhLD67hSXd5Fe7neqkTwJFhW1
	jXozXyyroP0jq60fsSfmFiBhEev5aWdekGkhiWevabk/S6j3lt497Rkrs4R0TnU70JEvuJwlBqE
	fawzRgwGftu1ywGZOjVAAgQrpc6V7XSyYabqpXltSQvLOx7YEd7piz/LdfKu7iIY2hao2EKfZMj
	FT2SoxAANw52Bitdkbg1W4Ewl0bCRdN1fymsbmcQ/wHgFFEUYyQPd5LOnjguDJB/yP9Bygw05K2
	nLnWv8nz0KnN2XbbN4ul59j6y99SRGWQlpSSmmiI0Aa+AmtPrzamAC0vYEbk1/PGTD3TOoyWaBH
	N87KWSvcc3CWQPd9zr38F91UokRi0=
X-Google-Smtp-Source: AGHT+IFXU+nC9ZIeAepoDKLNINnFSoupsWUwJ82hsu4iGdnTOqFrq4RmnDZ9NA5coiMKgryDL2/Yvw==
X-Received: by 2002:a05:600c:8b68:b0:475:d7fd:5c59 with SMTP id 5b1f17b1804b1-477b183de88mr11222795e9.16.1763536391552;
        Tue, 18 Nov 2025 23:13:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477b1037d32sm30368275e9.12.2025.11.18.23.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:13:11 -0800 (PST)
Date: Wed, 19 Nov 2025 10:13:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: CL Wang <cl634@andestech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] rtc: atcrtc100: Fix signedness bug in probe()
Message-ID: <aR1uAuEtucZ11VMd@stanley.mountain>
References: <aRxPGBEX8hbY6sjV@stanley.mountain>
 <aR0s653C4g2auavf@swlinux02>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR0s653C4g2auavf@swlinux02>

On Wed, Nov 19, 2025 at 10:35:23AM +0800, CL Wang wrote:
> On Tue, Nov 18, 2025 at 01:48:56PM +0300, Dan Carpenter wrote:
> 
> Hi Dan,
> 
> Thank you for pointing out the issue and for providing the fix.
> 
> You're absolutely correct that using an unsigned type for alarm_irq
> prevents proper error handling when platform_get_irq() returns a
> negative value. I will apply your patch and also review other return
> value checks to ensure there are no similar issues elsewhere.
> 
> Thank you again for your detailed review and suggestions.
> 

You're welcome.  These are just Smatch warnings.  Nothing super
major.

https://github.com/error27/smatch
https://github.com/error27/smatch/blob/master/Documentation/smatch.rst

regards,
dan carpenter



