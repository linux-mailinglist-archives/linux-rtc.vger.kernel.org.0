Return-Path: <linux-rtc+bounces-1289-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4F9062A0
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 05:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACD15284500
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 03:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A616312FF8B;
	Thu, 13 Jun 2024 03:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEv9HjnJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74D748E;
	Thu, 13 Jun 2024 03:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718249135; cv=none; b=LRQFulqRPZmGTClCvelbiumt0NMC9crSWuGnhW9f9/WBa961tfRIr/DS1Ex7N4jsmkspQi1gui41N32c+eG4GHMkC3vemQKJrq9UUpFKrIKeK0OfsNU7HlebsZTwkwkN+3FPQv8UXGjQpVQ+YfbqkvO+rPgwlXJUMCVYx7q+HcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718249135; c=relaxed/simple;
	bh=oLuXRIQ99xSi7LAybPdTF3RjeRzcGni9iF8X5uYneDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReLeyyKLPCxRy4t/akcXfdTKfV5pnP7n9xKtTPw/HItP9BnzyI1D31ouoxwZtXtvQR/LIgb/tOLBCaYg80Bb3t9WYC8+v2NV9JAApxasbVpzaiGLzYY+83e1bivi8vyGn9p7f6OcfL1t4kT6bd5/oazxopf2/HX6VDnRbEEkfJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEv9HjnJ; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-254f646b625so98193fac.0;
        Wed, 12 Jun 2024 20:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718249133; x=1718853933; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZz19BX/k+nGNMmcTEtPVga785qLPUBaZp98ECgi1l0=;
        b=IEv9HjnJ0yQvmtb+mOAftNoILYVd+xFQudkuJO8Zn9/WVkAHzZg8kI3en/xvvsOxFe
         QgzxwtgjocI7wm3UOYXok3ZwBuJ2DwsERwx0sWbFWrveZPmGTnuJtU4tra6eOqC14PKW
         BklcID9fe5d+4UU1YSaD8taJupqlKMcmZENzcP61BYGlch43TARpN6fr/0N1wg7Q0KzD
         XgyTa22CkzjhrciDVKAir0TuFneCSLDdErLwDfYqza/NAE1xzD80PhICBqPKT8DGWTE0
         bKO1YC7cA5Hoop+h3hSMDodbX2RjkoOKL2pNFJdsiQdLwg02ablUjhNFCXk4BV4BAYZZ
         1vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718249133; x=1718853933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZz19BX/k+nGNMmcTEtPVga785qLPUBaZp98ECgi1l0=;
        b=I4hL7oIUc1eLZC+orwFMQbIHRC+lkqbfGoGCktlc+2B7zaZUN8jM95ldhKmTDXoeds
         B7ZX5lczIzIBmtx7vtesPiLAJACJNG4i4xmod62r7RzLNZjBI4VwKDX1MHenX5Nd7dJ7
         tgxArqG+xJQRnOdbTJ8I8E6bf5ghZ2/JFai6U7iMzK/a6/qifgou3kmsT5oYV+y/+hvi
         DAE3CcKggY8De7Fa8AI4wLJvgtoD5dWMcpF0n76KAYRilXFrEM1pkm8qcUug5qr5wKJ6
         uOXIIg+am7iQ4lfWJxDQrlYwNQjZmvlHqERPKtTD4J2WIXj649k59MQtqEU4V9jA1xbB
         y3AA==
X-Forwarded-Encrypted: i=1; AJvYcCUWaks1+xIMyFFZMAc2d5KAanAKcqTi8LUXWbHCvpv0t+vJQN6Zs7srW/Ywwy7gXOoMc17nSApgKH8GNiieLC15eJL4EaYsDBHSU+t7uNAzTjKaIiqHxBS2rGFCF3BBa2pR21nLzs4O
X-Gm-Message-State: AOJu0YyM18/mg6MFOFlZvMFPL0Tmc4xdjxxbQE11qCczypdQIWb2lftQ
	rGL5zL6npu0YHI1ztftJNCMeoQgqXbBmbZHdxa9PSzBSpDPMuCFQ
X-Google-Smtp-Source: AGHT+IG+/ESvlCL9CMc/zwdeunXMnj21Xd6wGthRNQ60FTw/px/hboxRX9KTpg5iXzZ93Bw6JpsuFA==
X-Received: by 2002:a05:6870:7812:b0:254:7dbe:1b89 with SMTP id 586e51a60fabf-25514be2464mr3870727fac.1.1718249133166;
        Wed, 12 Jun 2024 20:25:33 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1b0fa8sm102370a34.28.2024.06.12.20.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:25:32 -0700 (PDT)
Date: Wed, 12 Jun 2024 20:25:30 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Miroslav Lichvar <mlichvar@redhat.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Szentendrei=2C_Tam=E1s?= <szentendrei.tamas@prolan.hu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds
 Interrupt
Message-ID: <ZmpmqlZUe-2nhUT4@hoboy.vegasvil.org>
References: <20240611150458.684349-1-csokas.bence@prolan.hu>
 <Zmks31shpsnoLQ3k@hoboy.vegasvil.org>
 <ZmlTQsgRiW9fmYcB@localhost>
 <c0b6ad83-b9d4-43e7-8c1a-14b71a2060f8@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0b6ad83-b9d4-43e7-8c1a-14b71a2060f8@prolan.hu>

On Wed, Jun 12, 2024 at 11:16:02AM +0200, Csókás Bence wrote:
> On 6/12/24 09:50, Miroslav Lichvar wrote:

> > I think a TCXO-based RTC can be useful to user space to improve
> > holdover performance with NTP/PTP.
> 
> Exactly.

Oh, the fact that the RTC has a TCXO is useful context to explain your
motivation and justify the need for this change.

It wouldn't hurt to include that tidbit in the commit message.

Thanks,
Richard

