Return-Path: <linux-rtc+bounces-1370-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8AB911B93
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E7B3B21066
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3BE12F365;
	Fri, 21 Jun 2024 06:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YEz8tGKj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427218E02
	for <linux-rtc@vger.kernel.org>; Fri, 21 Jun 2024 06:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951009; cv=none; b=IxBaCM6q+Lwz98Bb5ZkWOuXVoWsdvlr7mWnItGeTg6vvWV+C4R8BAHYyCbGYCA8gtnTqHwF8qEeDyVyV/qBWTRpH2pHmbTbHY6tEC/XDfSbavJWjEEXcpGb7azfnHnd1zIsVNCqCtqU2OGT91409iT92CXDgRcq6p2ng71QEv0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951009; c=relaxed/simple;
	bh=zMhNksKlxgDWJLOdWm5Srrf/T5GwEkXiwFjoRzm2X7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Aij/HF80gd79f3WOWXWga0TFDodGZRNSFp/hKDJzqra7w4nvWRzHhXYddOw4d3T2D2jNxdMWyIvOeirkEPSqNhFhHuwbNgPOArtE2+c8G8YvSHRxY191p7CkHKwUzFG+wzvO1t6JndGhE4t6gJ7icFBcm7LUsVeTTCDUjYIXo+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YEz8tGKj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4247f36f689so10216985e9.1
        for <linux-rtc@vger.kernel.org>; Thu, 20 Jun 2024 23:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951006; x=1719555806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkXmKbpIJRgUqctSd9ZQpnUJmrvVX9FaWF9GJe1dHqA=;
        b=YEz8tGKjGWSPhufcjqRjJ19owgdY1XgFmQJE/gmMPYQQ8QJuDx0WdMqGeOblFWHqVf
         srJ+4YYhWVLmQmLar4jRQFKK51K3qqVbsoli/nC8CygNeFYUFURtRx9oPxgZJp2+v7cu
         BnGqvVKQF8M8nokedI4udP0x1Wl5DVtsI7cGoZvj1cSJIEbKTJhKmUWupGQqVK88WKFP
         jwmSVOjh15UN8OHVwp2cznUA2yKh2NLNq+SVoSQEEmlGw8K0ompRzWlKTRcavJ9m2FPJ
         staYynUDW1nz7AnVdVtQQW5OaVAqH+sdzmxVAD5sYI51g8KhDNLKbA31rwD4Nmoc5Qm9
         LHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951006; x=1719555806;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkXmKbpIJRgUqctSd9ZQpnUJmrvVX9FaWF9GJe1dHqA=;
        b=XHbPfxkKMw3Q47qDmTmQsNH8az68tMYJGdJEzCx8uxHI30VWxP13OTIJvnPpJD+YjG
         Ek1CALzz4dK7m1by6oZbVd232XgKNUeJYmdO16awrg52ymXX/H2hBtyFQqSR1u4kdxdv
         BFwyulAvD306pmToHe0PbXslQsMfjyQ5FIW8T/DV11YGUUq0ZDScutppFAP2RZCzRjI4
         DbawKj8ITPhYP5CP6C95qNHOoyTCuvMat8f9mu5uUNL2KWcJxh2ISzB3AURur22Pv6dh
         Gs4hqCz7lVIlqkZUx/UzoY32Cl+7aXZXD2jpZO5d4c4oP35ADs0fG53q84BIT+FwBTrZ
         JMHA==
X-Gm-Message-State: AOJu0Ywt1vjyMaFxkht/4p7L3gewCVItxTclndum1A27MAmH4z39mSlK
	LSU9La8fKG5t2AWjoin3819J0CvQjLjzA1b3QKKpCYN6uhn+nbO9+blqiR8AH1I=
X-Google-Smtp-Source: AGHT+IGRxVnvqEGjCt60N7h0oLYURKo03b6UBEbfAzRe8XBa+0Djr3OY8r+KHjWNaMVb2TsZUB8/4Q==
X-Received: by 2002:a05:600c:1d8d:b0:424:7e0f:df51 with SMTP id 5b1f17b1804b1-4247e0fdf9dmr27675525e9.33.1718951006199;
        Thu, 20 Jun 2024 23:23:26 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817aa340sm14204335e9.19.2024.06.20.23.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:23:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Sean Anderson <sean.anderson@seco.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Joy Chakraborty <joychakr@google.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20240613120750.1455209-1-joychakr@google.com>
References: <20240613120750.1455209-1-joychakr@google.com>
Subject: Re: [PATCH v2] rtc: abx80x: Fix return value of nvmem callback on
 read
Message-Id: <171895100442.14088.18136838489262595773.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 07:23:24 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Thu, 13 Jun 2024 12:07:50 +0000, Joy Chakraborty wrote:
> Read callbacks registered with nvmem core expect 0 to be returned on
> success and a negative value to be returned on failure.
> 
> abx80x_nvmem_xfer() on read calls i2c_smbus_read_i2c_block_data() which
> returns the number of bytes read on success as per its api description,
> this return value is handled as an error and returned to nvmem even on
> success.
> 
> [...]

Applied, thanks!

[1/1] rtc: abx80x: Fix return value of nvmem callback on read
      commit: 126b2b4ec0f471d46117ca31b99cd76b1eee48d8

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


