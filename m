Return-Path: <linux-rtc+bounces-3700-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F00A74BAC
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E5EF3BDF6A
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464C61EB5CD;
	Fri, 28 Mar 2025 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdhxabIo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2941AA7A6
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169254; cv=none; b=bIX1p73yUh54noHsVTvLUGGhgt1GUQmeQhctKNRMfMcT3+SR9FEUA2JD24nyF9jLBwXQa1Myny/Qjrw5buJa6MLh5I8nuw1amOaPfD4PNrMVIhOTcGJJSppEIPK77pzXA+t769LSnTlf/L3Tx10Sv5r9q5k+fLCa/oHrBRgRves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169254; c=relaxed/simple;
	bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OTVSy0drfdjIcmnM58vPPrnXRLZVTJVDByb7rgoz5hY4OoKmolpfHcaIYgadrYRLLWqXtrC5cGqVoggtpvB8KCMFOjfYXTeRxE9No8mNf3o/XxNiPUKrbwuYELZUb3yUbSkxOVj/pgK5d4ncKXj+AQrmoqp6muL7nC5BwQKKIi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdhxabIo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso22142235e9.1
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743169251; x=1743774051; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=;
        b=jdhxabIoYHZ1r4hXR9PBvi3oCobElBxj64Q7mh/CLkM+I9utbJ0Wn4mm+BHzoFLvFB
         MjrUC7cbkJXbMJpUQRjR7C5BkQI1bT3LJ3EJirKUUvs5lQZb+bF8wMz0iK5zKLOZ44E5
         5LC/51Vk3FQTQ+DxE27H9JjKG5+EM+egzH3dE7UfaoRY4nXOqe/Y5ZDZ0rX1DOSqjbzv
         rBeb/nGF+SBk/EDQAD1+SyKT3LDxgSe91+E1A7i2PsuFpSA6qnCgxX5OJ0PuvcQSKM1W
         UPrOJj1eW9O52GTtCCJln2w8Pio3yNmLR5mCyDI8bcinN2vwI8STipJTsD16/5sPwZ5/
         NR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169251; x=1743774051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=;
        b=VUWhuRWgeqIKpXjJkeq2LeH+fK/4XFvKroPkr1zZMcdHSbmEJeX9tJVPSKwISNp6DR
         qmN4alGvEDx/wGHgc9eaLAJYXzhD19PymbJRR4LAzy88pqf+OvghG7iHW7kfyCNu3Whs
         3KYN6O0Vd7U7r17ZyUd8qdMfmupdgNkTmv3QcaBV3QEIkVzW7nBWzSKDnRjeKCkR2Z9/
         cN2PWPWKL20HmzmWUuD6x7ojmyF8DdI8fA71mwEriK6cOZaeMt+qMDBuJHWgTU0TIO9z
         l1mngr1SSTuklCi4FbwEycTeS+egHbI4n7plo68C9RuJPaKPR6G/LYMZ0fMfgtmPwnnr
         1Dmw==
X-Forwarded-Encrypted: i=1; AJvYcCVRf8vQvQfOVzTVdRlkw7RYELPVX1JIrdL5fMyqJpOWFzx98N337Quw27EGcQlFdnKhlWGyKx3MF+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCtJFFk6qOr+wl6V8otCiu7D1njrhujjHCh0wpISUNWzP9PnNw
	9d6S4fdmoHUFHIq/KY2wT+0TjFcavdiED1IyNWi11iL6/QOHT6RU2Z1EjIZbA14=
X-Gm-Gg: ASbGncsmPpV5c0Hk+GM7LZ+Rv9tIn8JNlMH9qsql5/zHsjYOGfNFYR0nKx8h899WMiN
	Uav8XyggXbogKAz6+R7BI5Ax95p8ju3Dks8z/cVjXCvyVH9srOpVU4JW/OkcmiWP6DOFiewPxx0
	50DJ61CUE8AU7sbIWi/ChBjqkZv5rEvKKFQ7rEyVEhHtDCT43gb///3Nh6u1Lu3bYdhOBbN14AV
	GsoJlQ9x8MsXE49+3Y+f7D4OxyzYCupnZm+75akrqc5dNUzw+xKyeXMnZO1tuKgC+5A4rZhYw9u
	hFS/mxQFmPop3wER5FXGXZryNnFnqiNvaxQD4zROuTkHCNhm
X-Google-Smtp-Source: AGHT+IHwHjuKaCXwCLJb2L7VuxUBZjvvxP2g/BLNcbOaZ9V7ELDXVBGUe+axHxG86hTFzSZGV12KgQ==
X-Received: by 2002:a05:600c:1ca9:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d85098781mr71142935e9.27.1743169250696;
        Fri, 28 Mar 2025 06:40:50 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm27701695e9.28.2025.03.28.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:40:50 -0700 (PDT)
Message-ID: <10216af0d2a3c85cba2bba1356a50b488947125d.camel@linaro.org>
Subject: Re: [PATCH v2 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Mar 2025 13:40:48 +0000
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-03-28 at 13:28 +0000, Andr=C3=A9 Draszik wrote:
> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> *** dependency note ***
>=20
> To compile, this depends on the Samsung ACPM driver in Linux next with
> the following additional patches:
> https://lore.kernel.org/all/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro=
.org/

There's a v2 of that one:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.o=
rg/

other than that, everything else still stands.

> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.=
org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@lina=
ro.org/
>=20
> *** dependency note end ***

Cheers,
Andre'


