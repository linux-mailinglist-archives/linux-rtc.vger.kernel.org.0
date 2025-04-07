Return-Path: <linux-rtc+bounces-3807-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 581B4A7D19D
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 03:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FFF23AF539
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 01:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966091B0402;
	Mon,  7 Apr 2025 01:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+iUWVe6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82BC12CDAE;
	Mon,  7 Apr 2025 01:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988178; cv=none; b=jXCo6pden7wv8EfW9VdPV94Lov8KJxcoo14s+QVwOze4mNq4w8GGd3hFoQSYpfKAsxaGlcxvZ2H3OKR6vTcj6uaROLe+ipQqyX2qgLfDcq+TGq4Z8FXbaWib1uw3Lbf9QFOoEz4duCLWI6T19LzF7ZUXCfSyGnrqQ3nBIrgqNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988178; c=relaxed/simple;
	bh=qFpJkpO6DX3BTQg+eiAtTfhhkQ3s3RXSaTPwP48oVPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZIYO7Fqe4143OO8fxq5tDoFFkc34SGbmWOS3EFvloLAmrn8Y7cW0k5wQu+reUf8zcotLk5go1DPPGsa2z83ZJxvEfBkkTwKipSk4QqsIo5u8O/9PsyRm3XqYF/zFGp/LSDfmdArDREsCxiw3XF9pd23cvKyAzvkTtcJsSOOVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+iUWVe6; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-477282401b3so40455931cf.1;
        Sun, 06 Apr 2025 18:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988176; x=1744592976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTaxpP+0BisXpBWkHEPT5jUCMTocLUlCjk3pVjz+dsA=;
        b=j+iUWVe6j7LFZ3xU6i1TU9QcGtmD2hG6RuMJqwFBoi0TMGvskZcqxoKRpejFEZ4ey1
         Z0EHc7QaPhcm/Pn8Qch0plbG3PKkbvZ+TxcrvvvkqwgQ19TCfFecbW3qBVie6Iy7NY/W
         k0pM+70aYfdoDZKN0RM64X/9V3yu7D3p3hN5bfy5lwwlMIFeoQfVgC3uzmogtSQgrF2h
         Dq/omhczqYBqnCt1PpE2tmG3vxxhDRRsU/8igSNcEWb1qmUUnWIMc6Zsq4bAS4gBQEgw
         ILuocmjZLJd8rYCotY97maeNtqehqSrnnYpVlEqiB1xI3Ll+YoFrpyOHvHOsu+oDCOUk
         oWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988176; x=1744592976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTaxpP+0BisXpBWkHEPT5jUCMTocLUlCjk3pVjz+dsA=;
        b=leTqD/yO094z6s3dhQwkyTMJGjKcWmAltqxPdgLYSUEFzu9dBQ6xD63g/pGQDawOK0
         9WpUIoHLviYUvkkApUoI9K+9qFjG8ZAbxvhfzIs0ZcGoQr98WxlqNPMv0sFpNqjkiXb4
         V9SaBR00NlMGPQ4xahm/Fqo3YvJcGW4QZFRrcP9UAIc3GtXyNaPEDL2ItPSNCLEZx6+l
         0S0Fxk2yuErCwjFgM7RZQerMMAKeWAb0KyFnLuX081uL8A62ggKjr1ynO6YoAzGXCn/S
         GCdKNkLtDBPUb3NWVWLw7oV/50q8BF4Wq+FLFmfjh/ERYa6wcwU0+Q44Mt2IUswI9kxl
         jDlw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Au7voQnh3QBqZYO9ZqJlhe+0/2wiJfLPXENtaRH1mm/kdtxVsprAWDr3i830n1ICDyNnXGcR5yseXcND@vger.kernel.org, AJvYcCVYJwf62ldAtiqAQlL4ut3+YCB2m68wtroMRly0KDGzJtSoRm46PXFyhti1V18LTVY73npM958efpWU@vger.kernel.org, AJvYcCVanqDUqr325+OidOPFR4dOHsYy2KwaUiqNxLb4D+x92wXcA6Lm+bV5aioG0bXYP6eySwsqlNtccKbu@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1tyNdptXfucPFAaVzGQFpI2k9d+f57ohotw4WeLZVF30jhmJ
	4eWnvC1nHyFdkqpFT1N/iBl1cW4OzFkRnIXOZsoR1WrB1OwKkw1k
X-Gm-Gg: ASbGncuQ56QWn6cwZlB3GDB9R8zA8w7BEVs0ZzX2bBMxe6MR7QHCxF7vwamd6cyZzRU
	J6pLpXQhgTMX2j2CWtHQsqS1IFm5TmURnQnvrCTS5fDDlL/cb2kmJgQ4m9QQ8M8L6P6g9Vq1v31
	3JYjPXIF8RF2D8Be3dDd7QmwXsXrjnhcgqEOU6RwgadOyiINrtaJwbF9kPSeZOgxkDnIP3P9bu+
	1z+ALOoLA01bcy4PMoRtQEmgs/vU0+5r/gOV7hB4AkTivWIJpGDLuHv3PI5LlpEa5NStigPfB3Z
	sMaG8mJ+vjMkA65g2PiY
X-Google-Smtp-Source: AGHT+IEmKlIM4zH7lzG9UIKklSuD+qJQ6td8rm/OkZNC5rmvxg8J4PmWcLtB3/5GZa2BN0aYjGS/Gg==
X-Received: by 2002:a05:622a:180a:b0:476:80ce:a61f with SMTP id d75a77b69052e-479310eacfcmr110677731cf.39.1743988175814;
        Sun, 06 Apr 2025 18:09:35 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b1444d2sm53175581cf.76.2025.04.06.18.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:09:35 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:09:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
Message-ID: <vxjtdvy5vxhmqldgvt4mgeuor36gdjriiai7y3rej3tevuwisa@wpupxzhvc3tt>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309202629.3516822-2-alexander.sverdlin@gmail.com>

On Sun, Mar 09, 2025 at 09:26:23PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> called RTC, but contains control registers of other HW blocks in its
> address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
> 

I think this is a mfd device, so why not moving this into mfd subsystem?

Regards,
Inochi

