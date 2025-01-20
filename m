Return-Path: <linux-rtc+bounces-2967-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8874AA17295
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 19:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F24B7A248B
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 18:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E211EE02E;
	Mon, 20 Jan 2025 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="mxJXUwlC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5D1E9B25;
	Mon, 20 Jan 2025 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737396739; cv=none; b=d7n4wUaeTw/ekiwUTaiPs2v4JNwgKFabROGF6Z7G9XebJu6wuu1K6kp4M2H9NRD9Xsh8+i9KsksdBw66qopiG9e2jAIM91BmpmLRidAD0PH5y6tPH74PNC9pYSPPvHUmgz2+ZKGWnHQuZGCZ9A9yms2agjhpR7c+0eT2foIFiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737396739; c=relaxed/simple;
	bh=owJKCle4OqQVn6FlWGAYuamsFy32fdIeVO7S6JSibvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1+58M67LSq2ACPJ0L2QdXkJSZtJut/h/MFxqOKi0PnHWA26ZVLlLW+QPBE/4jnM71G7PJS+aHplITeCa+ZbF2pKVvQRW3AQQGQJDaDLXByhkTZEjfRMxuvYYUDZC5E3Zems40LyYoA7PAF42SkSNERNwbYkFnbQb8bCg+nGO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=mxJXUwlC; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1737396727; x=1738001527;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=YEP8Ka7Kbfimz7RVhloCaYpKFMYx1Qs5MiA+dYWzwaU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mxJXUwlCl4hVcV3R7GQeflKD331aupkxDo4OveXOWuN5Ts+IDH1iyA43rHjFO3KC
	 xN3zg1hEIcWSleNFzkKEx8US+Fa8MeU60znpKfJhZbp4UuSbyzOvCP93uhBjt3YeH
	 dzAtSY1j6dRnGxANgPPgaa6a1CmHbwbMnWJqXQ7BbkPkUElLC++3qh3ZhN/5PAuVY
	 TBmvPhVqPWPs5jBg0mNPyMN9Bmuf0EZ4OdwURJra5qBz86y9FLKZtwllIkaslqfsI
	 TXA3AZ+iOzv9oZXCtDec/K3hqDmY5UeVeCeaXT7+Zbp1MB9e42GeYFgxD9yEI2oRy
	 uwWvab40ziev5Fq9hQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.152] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvKTJ-1tIXnL3EJ7-014a1f; Mon, 20 Jan 2025 19:12:06 +0100
Message-ID: <d6ff6f2e-9280-4fd0-af4c-f50b35652800@oldschoolsolutions.biz>
Date: Mon, 20 Jan 2025 19:12:05 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: x1e80100: enable rtc
To: Johan Hovold <johan+linaro@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250120144152.11949-1-johan+linaro@kernel.org>
 <20250120144152.11949-8-johan+linaro@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250120144152.11949-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1TfkxTgRZJn+MQWuwHQRQSzb/l+QOzHh9WKEkNqAYxUT7C4xgXb
 tvhokOvPJkAu8Dt2DyNGgj2NInP8qhM0ZZSUJh/JLI+0AMpaT/2S9HifqtUESV5pzYpwnP6
 cxcopN5qFNH1P+cgPITShMGDXF0LgwmM39RcDD5pATxUG19MAlCYnkYt9g6zh7M32Z4ehdG
 CGlXdEZUEaDBMkBhyqC0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ThfM0vLkFqA=;HQpAAXiCT3WmRqoafFGYLUyBxyM
 ltBIrG987qqQkxyNJhLreKYwmn9XRWs1JDQE49KxpsiNRP5t1ZGkOKUrasueSSWaiElkVVoCy
 QcrlnsWEo9ji1ZevFw0PlAP85b0qW2/uqUhB5bd9qAV78ydu/gMgFcx6YcGw1noYsGNGHzXC2
 rtPtYIy6LbnkBAyxtySgKSpEPM0M+6qTNQaFMqB4JtrbXyhQU6iKtBuZMGJFEnbXqTsu0YSfk
 zUP33JTs+R1VnKhrM2RigBA7XCB+j0ljPYGZvXO7k944FwUWrtgXZZE9omM4x9Os8AJjmCQ33
 kbDuJL+4/XyWUlo9h9NBtrnjX4eP0Rx3O+Ot57Z5G+P8goMSxNlSLsII6Hv9Q34zZOJZmx1J6
 21Pb5Fi04Df2qgEzvWFz0HA8rP82Qj3u4Cx+KRJGGCHR+LeDf9GYJkFthg5pAcvmYMe6C9Sdj
 p/72bKr+UinS23B17JZG6arOFhNPcCrlp52MGVH3YOe5weBe8WzCCglLVbwd/+f14Ghn+E9us
 mYYfz1K8aRCA5sdvemh1jJc+it+Afk91gNz623jhV5BsEk7ikFzOJ+sp3XTy9pm0cRnP/aiG5
 +b6i1MzySvJMFtt1RSczdgExrEEuJIYPXjoQZDvzCkLlwtPspCqHlaeBVg2ShJzvZ89GxWTRZ
 OJmRp3Ub9rGE9XSkDkEWknAkwz118hkAq0ITR3PW+jVJ3HYusAVoFk5CGLK7m9jYHM8S7JIuP
 uHzTr9idP2FgpbDD7rFeshfZBPxgNjOJ6KcQTQNTUAPntQgd3WxHVytYRJq+aatp+lET1NgwA
 g7u+lrpKYNijdT78A+ZCmwypGvih6c0tfrSDCF2D5CeZxoOb/VNl3a7pGO3Oyu0iQOgPO9qIg
 806B50eyj9yXU53Ln3J2fW4U3X4tYz3OBhnk1C+RwiYuacdXt1WU3pylEqdz3xxa/2oR9M5oF
 cCn+rTkh268ssaCSJTM3Auumjk6BGEQJ7o9I55kcVbzwZCo2wMwpUZycqIJ6cZ8DMKidoHsO3
 t8TZcsfZc7JW4omL8bmMefPovtKc9NxkpSgRO1xslqz9yXW9Hsi431X0ZFVt8tx6DNl5Rf7n7
 94N0qc7Aq8dFUB+MLEaGWofkKMWvEaJBoXxDtf+qfkg0+EsGAunlPk+eJBg3m2JZ0Qy4IY9/A
 =

Hi Johan,

On 20.01.25 15:41, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
>
> On X1E based Windows on Arm machines the offset is stored in a Qualcomm
> specific UEFI variable.
>
> Unlike on previous platforms the alarm registers are also unaccessible
> on X1E as they are owned by the ADSP.
>
> Assume all X1E machines use similar firmware and enable the RTC in the
> PMIC dtsi for now.
>
> Based on a patch by Jonathan Marek. [1]
>
> Link: https://lore.kernel.org/r/20241015004945.3676-4-jonathan@marek.ca =
# [1]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/b=
oot/dts/qcom/x1e80100-pmics.dtsi
> index 5b54ee79f048..051fb3a304b9 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -223,8 +223,8 @@ pmk8550_rtc: rtc@6100 {
>   			reg =3D <0x6100>, <0x6200>;
>   			reg-names =3D "rtc", "alarm";
>   			interrupts =3D <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
> -			/* Not yet sure what blocks access */
> -			status =3D "reserved";
> +			qcom,no-alarm; /* alarm owned by ADSP */
> +			qcom,uefi-rtc-info;
>   		};
>
>   		pmk8550_sdam_2: nvram@7100 {

works nicely on SnapDragon Dev Kit X1E001DE. Thank you!

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens Glathe


