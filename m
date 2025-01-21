Return-Path: <linux-rtc+bounces-2969-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74551A1765E
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 04:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF70D16A600
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 03:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E991741D2;
	Tue, 21 Jan 2025 03:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="TUbCz3hi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4D3208;
	Tue, 21 Jan 2025 03:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737431319; cv=none; b=JxcWJHV8/gM2Md/5tNVy5kc8q4T48q+4WUJoUKnubCCLAIbWYRIXRYeadTRpwipNtdq231l63nXizE7SPIbkoPE/fKLz+5o9iJ+S5WcmfGW+oWpw6IswDvnwgVSSGua89ypmaQpU1dNg+WtCn5Z3HdEsvfLwx6u9J5v824/o0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737431319; c=relaxed/simple;
	bh=nXeR4WCU1+fTpqluUqiiZxteQYC3c2jVgdFHmwxlQ5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UkLqWnvg9uGoeftqwvGqAUyYvx9SJ30PFsI0crY7EJH+XmeMIde0QjYqxa+4WVWOAgM2DI1VyKxwzkoSLE7XtUFDtoUM3GI4MPGV4R0rOtQhk0wZpUw4Hqw0RNQy/rqdAvBrjnHiFqGBUEEtG9BezH9HhPx0eQEb0mdp94A3cFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=TUbCz3hi; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d9f0a6ad83so1333357a12.2;
        Mon, 20 Jan 2025 19:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1737431314; x=1738036114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aB6kMUwc3sdr22D03Cs6X1hTCEIAljfWSL5/SAqjcnA=;
        b=TUbCz3hiLKG9I4iGJ2bY8KTOAzHaiSE2L+Vno7ZMT7uYodbRcDPQrdHrhNUXM5MfMB
         R68RMhBHJQYI6bLhMT5Cg4+ZuMSblCFKDL4ZQfeVr4b0QZ9uUvKThWLOUtUnoCOmlme6
         k8/+DKtdgJLx0uI8/rBAweoXTA1lU+qb4uhqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737431314; x=1738036114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aB6kMUwc3sdr22D03Cs6X1hTCEIAljfWSL5/SAqjcnA=;
        b=jduK6lBD+UEfnqFgXMXCm4ixbmlZTz5J3U/afxLzWNq9rV28egM7K0nIEDa5T1EjqJ
         jT3VKjqP6eYV3Le9fg1lkWw6PMrkaCTHye11lmYRmelGcjZiDRHpSU6ljz9hkxwTs2WO
         vUYDYdoPIOBLkitzx4RceSjDxl2rtquTFDPdo354COn3zKkDQsFaSWzj45eNV/7Mfz9E
         ZPk9QTgYkjbpkjOIibw8cCW+UCdYeNdnmV1eBsM6Uw/Co76sjLEdZjYHaLTYox1BZ6lu
         ieSSh8Dz5vjc9Qm481OLfIz0pSWjKP7/xnOBR2TQHTNRgghpBtYwoFW+GppNNTIR7d39
         aMRA==
X-Forwarded-Encrypted: i=1; AJvYcCUM4P8lls07R+SavYTRSu1zu4MDT8L1WJtehQC3dCEB+pdK+hZJnnER8+eWIfqK3oo0ioPmOvmIVOUD@vger.kernel.org, AJvYcCUljR44e0qf1ZQl1CTolnHde1ETgwYbgDZqxYjXfh/cvuU7yasgvLzRiKrMzd5WOAHxRB759v3O3jMIzwZ0@vger.kernel.org, AJvYcCXKmyZ05JRMtB4jNzezTeOg9zOZRMTOAI4tWhNOiCUf/Y+/sAJFk/yLncVWvem/LkielKlVEhntDAa8sof14A==@vger.kernel.org, AJvYcCXXR9qvtJSO4pZ+K6Z0TRDDMAm5AXo64LbKUGhMbRdZpW8ENAUPIhajY7+liWZ8UIEbgWDXD5gvdDP5@vger.kernel.org
X-Gm-Message-State: AOJu0YzpZAa/ivtEiQ4BhC0u55Qy1GdI+s2YOFGK64pVeob13YNcyovq
	5Ny7i1ZERgzmC8Cy0Brvz17EvKFzOmFWm7oC55w0jGyPXuRwRx1icD3kk9N7XC4TMY/sWkfJmYa
	li1Yr+eNPIYMubfM/x1AnWYfH4d4=
X-Gm-Gg: ASbGncvzzg+rzXKzZ8HaNLQT4nwQ0NrvTtMQbt8ndCMrWT6p7fZNzN0zF4iRT8mc+GB
	6mPNgclTS7EVYxslAbiRWL6FLnhenZDVw6v7EHI7FzNxg0Rx3bQuZ
X-Google-Smtp-Source: AGHT+IEioTHynGNYPsBVBnXk2SJD7rsah+5RbvpgkTjY5HEFTlzZP30VOKUh54KqdkWiyoFZdCv9DfqyjzNkT2br8Ag=
X-Received: by 2002:a17:907:94cc:b0:aa6:85a4:31f8 with SMTP id
 a640c23a62f3a-ab38b32ad1fmr1332346666b.33.1737431313488; Mon, 20 Jan 2025
 19:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120144152.11949-1-johan+linaro@kernel.org>
In-Reply-To: <20250120144152.11949-1-johan+linaro@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Jan 2025 14:18:21 +1030
X-Gm-Features: AbW1kvZyewKuudLcQbNpI1AM_h2bKq-qxMhskJ_sh8Oo0pf4MbyF0KncgPdAk_Q
Message-ID: <CACPK8XftgBDoy1echN7VKx9Te0o37PvdqCUiJN7YGpkdK-3fJQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jan 2025 at 01:14, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> This series adds support for utilising the UEFI firmware RTC offset to
> the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> Elite machines.

Looks good on a Surface Laptop 7 / romulus:

Tested-by: Joel Stanley <joel@jms.id.au>

[    0.407844] rtc-pm8xxx c42d000.spmi:pmic@0:rtc@6100: registered as rtc0
[    0.407876] rtc-pm8xxx c42d000.spmi:pmic@0:rtc@6100: setting system
clock to 2025-01-21T03:34:06 UTC (1737430446)

Cheers,

Joel

